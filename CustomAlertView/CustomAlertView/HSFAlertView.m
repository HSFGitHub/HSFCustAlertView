//
//  XHAlertView.m
//  CustomAlertView
//
//  Created by 胡双飞 on 2017/11/27.
//  Copyright © 2017年 胡双飞. All rights reserved.
//

#import "HSFAlertView.h"
#define VIEW_FORMNIB(__NIBNAME__) [[[NSBundle mainBundle] loadNibNamed:__NIBNAME__ owner:self options:nil] objectAtIndex:0];
@interface HSFAlertView ()
/*icon图片*/
@property (weak, nonatomic) IBOutlet UIImageView *icon;
/*内容Lable*/
@property (weak, nonatomic) IBOutlet UILabel *contentL;
/*存放“确定”按钮的BgView*/
@property (weak, nonatomic) IBOutlet UIView *onlyOkBtnView;
/*ok按钮*/
@property (weak, nonatomic) IBOutlet UIButton *onlyOkBtn;

/*存放“确定”与“取消”的按钮*/
@property (weak, nonatomic) IBOutlet UIView *CancleAndOkBtnView;
@property (weak, nonatomic) IBOutlet UIButton *cancleBtn;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;

@property(nonatomic,copy)ClickOKBlock okBlock;
@property(nonatomic,copy)ClickCancleBlock cancleBlock;
@end

@implementation HSFAlertView

+(HSFAlertView *)alertViewString:(NSString *)string{
    HSFAlertView *alertView = VIEW_FORMNIB(@"HSFAlertView");
    if (alertView) {
        alertView.contentL.text = string;
    }
    return alertView;
}

#pragma mark - 默认图
+(void)showContent:(NSString *)content{
    [self showContent:content clickOnlyOkBtnBlock:nil];
}

+(void)showContent:(NSString *)content clickOnlyOkBtnBlock:(void (^)())clickOnlyOkBtnBlock{
    
    [self showViewString:content type:HSFAlertViewOnlyOk okBlock:clickOnlyOkBtnBlock cancleBlock:nil];
    
}

+(void)showContent:(NSString *)content clickOkBtnBlock:(void (^)())clickOkBtnBlock clickCancleBtnBlock:(void (^)())clickCancleBtnBlock{
    [self showViewString:content type:HSFAlertViewOkAndCancle okBlock:clickOkBtnBlock cancleBlock:clickCancleBtnBlock];
}
+(void )showViewString:(NSString *)string type:(HSFAlertViewType)type okBlock:(ClickOKBlock)okBlock cancleBlock:(ClickCancleBlock)cancleBlock{
    
    [self showViewString:string imgName:nil type:type okBlock:okBlock cancleBlock:cancleBlock];
}


#pragma mark - 可换图

+(void)showContent:(NSString *)content imgName:(NSString *)imgName  clickOnlyOkBtnBlock:(void (^)())clickOnlyOkBtnBlock{
    
     [self showViewString:content imgName:imgName type:HSFAlertViewOnlyOk okBlock:clickOnlyOkBtnBlock cancleBlock:nil];
    
}
+(void)showContent:(NSString *)content imgName:(NSString *)imgName clickOkBtnBlock:(void (^)())clickOkBtnBlock clickCancleBtnBlock:(void (^)())clickCancleBtnBlock{

    [self showViewString:content imgName:imgName type:HSFAlertViewOkAndCancle okBlock:clickOkBtnBlock cancleBlock:clickCancleBtnBlock];
}

+(void )showViewString:(NSString *)string  imgName:(NSString *)imgName type:(HSFAlertViewType)type okBlock:(ClickOKBlock)okBlock cancleBlock:(ClickCancleBlock)cancleBlock{
    
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    if (!window) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showString:string type:type imgName:imgName okBlock:okBlock cancleBlock:cancleBlock];
        });
    }else{
        [self showString:string type:type imgName:imgName okBlock:okBlock cancleBlock:cancleBlock];
    }
}

#pragma mark - 公共方法
+(void )showString:(NSString *)string type:(HSFAlertViewType)type imgName:(NSString *)imgName okBlock:(ClickOKBlock)okBlock cancleBlock:(ClickCancleBlock)cancleBlock{
    [self dissMissView];
    
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    HSFAlertView *alerView = [self alertViewString:string];
    alerView.type = type;
    alerView.okBlock = okBlock;
    alerView.cancleBlock = cancleBlock;
    if (imgName) {
        alerView.icon.image = [UIImage imageNamed:imgName];
    }
    alerView.frame = window.bounds;
    alerView.alpha = 0;
    [window addSubview:alerView];
    [UIView animateWithDuration:0.5 animations:^{
        alerView.alpha = 1;
    }];
}

/**
 隐藏View
 */
+(void)dissMissView{
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    NSMutableArray *alertViewArrayM = [NSMutableArray arrayWithCapacity:0];
    for (UIView *subView in window.subviews) {
        if ([subView isKindOfClass:[HSFAlertView class]]) {
            HSFAlertView *alerView = (HSFAlertView *)subView;
            [alertViewArrayM addObject:alerView];
        }
    }
    
    if (alertViewArrayM.count <= 0) {
        return;
    }else if (alertViewArrayM.count == 1){
        
        HSFAlertView *alerView = alertViewArrayM.firstObject;
        alerView.alpha = 1;
        [UIView animateWithDuration:0.5 animations:^{
            alerView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [alerView removeFromSuperview];
        }];
        
        
    }else if(alertViewArrayM.count > 1){
        
        for (NSInteger i = 0; i < alertViewArrayM.count; i++) {
            
            HSFAlertView *alerView = alertViewArrayM[i];
            
            if (i == alertViewArrayM.count - 1) {
                alerView.alpha = 1;
                [UIView animateWithDuration:0.5 animations:^{
                    alerView.alpha = 0.0;
                } completion:^(BOOL finished) {
                    [alerView removeFromSuperview];
                }];
            }else{
                [alerView removeFromSuperview];
            }
        }
        
    }
}


#pragma mark - setter方法分
-(void)setType:(HSFAlertViewType)type{
    _type = type;
    
    if (type == HSFAlertViewOnlyOk) {
        self.onlyOkBtnView.hidden = NO;
        self.CancleAndOkBtnView.hidden = YES;
    }else{
        self.onlyOkBtnView.hidden = YES ;
        self.CancleAndOkBtnView.hidden = NO;
    }
}
#pragma mark - 按钮方法


/**
 点击背景按钮

 @param sender 按钮
 */
- (IBAction)bgBtnAction:(id)sender {
    [HSFAlertView dissMissView];
}

/**************************************************/
/**
 当有一个确定按钮的时候，触发该按钮方法

 @param sender 确定按钮
 */
- (IBAction)OnlyOkBtnAction:(UIButton *)sender {
     [HSFAlertView dissMissView];
    
    if (self.okBlock) {
        self.okBlock();
    }
}


/**************************************************/
/**
 当前在“确定”与“取消”按钮同时在的界面，点击“取消”按钮触发方法

 @param sender 取消按钮
 */
- (IBAction)cancleBtnAction:(id)sender {
     [HSFAlertView dissMissView];
    
    if (self.cancleBlock) {
        self.cancleBlock();
    }
}

/**
  当前在“确定”与“取消”按钮同时在的界面，点击“确定”按钮触发方法

 @param sender 确定按钮
 */
- (IBAction)okBtnAtion:(id)sender {
     [HSFAlertView dissMissView];
    
    if (self.okBlock) {
        self.okBlock();
    }
}
/**************************************************/

@end
