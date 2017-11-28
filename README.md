# HSFCustAlertView

单图：



使用方式：
#pragma mark - “确定”按钮
/**
 弹窗显示内容

 @param content 内容
 */
+(void)showContent:(NSString *)content;

/**
 弹窗显示内容
 
 @param content 内容
 @param clickOnlyOkBtnBlock 点击确定Block回掉
 */
+(void)showContent:(NSString *)content clickOnlyOkBtnBlock:(void (^)())clickOnlyOkBtnBlock;


/**
 弹窗显示内容,可更换提示图（ @2x ---> 103 px * 102 px ; @3x ---> 155 px * 153 px）

 @param content 提示内容
 @param imgName 提示图名称
 @param clickOnlyOkBtnBlock 点击“确定”按钮Block回掉
 */
+(void)showContent:(NSString *)content imgName:(NSString *)imgName  clickOnlyOkBtnBlock:(void (^)())clickOnlyOkBtnBlock;
#pragma mark - “确定 与 取消” 按钮
/**
 弹窗显示内容
 
 @param content 内容
 @param clickOkBtnBlock 点击确定Block回掉
 @param clickCancleBtnBlock 点击取消Block回掉
 */
+(void)showContent:(NSString *)content clickOkBtnBlock:(void (^)())clickOkBtnBlock clickCancleBtnBlock:(void (^)())clickCancleBtnBlock;


/**
 弹窗显示内容，可更换提示图（ @2x ---> 103 px * 102 px ; @3x ---> 155 px * 153 px)

 @param content 提示信息
 @param imgName 提示图。尺寸（52*51）
 @param clickOkBtnBlock 点击“确定”回掉
 @param clickCancleBtnBlock 点击“取消”回掉
 */
+(void)showContent:(NSString *)content imgName:(NSString *)imgName clickOkBtnBlock:(void (^)())clickOkBtnBlock clickCancleBtnBlock:(void (^)())clickCancleBtnBlock;
#pragma mark - 
/**
 隐藏View
 */
+(void)dissMissView;
