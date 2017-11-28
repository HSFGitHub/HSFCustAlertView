# HSFCustAlertView

单图：



使用方式：
#pragma mark - “确定”按钮
/** 弹窗显示内容 */
+(void)showContent:(NSString *)content;

/**弹窗显示内容 代Block回掉*/
+(void)showContent:(NSString *)content clickOnlyOkBtnBlock:(void (^)())clickOnlyOkBtnBlock;


/**弹窗显示内容,可更换提示图（ @2x ---> 103 px * 102 px ; @3x ---> 155 px * 153 px） */
+(void)showContent:(NSString *)content imgName:(NSString *)imgName  clickOnlyOkBtnBlock:(void (^)())clickOnlyOkBtnBlock;

/**弹窗显示内容*/
+(void)showContent:(NSString *)content clickOkBtnBlock:(void (^)())clickOkBtnBlock clickCancleBtnBlock:(void (^)())clickCancleBtnBlock;


/**弹窗显示内容，可更换提示图（ @2x ---> 103 px * 102 px ; @3x ---> 155 px * 153 px)*/
+(void)showContent:(NSString *)content imgName:(NSString *)imgName clickOkBtnBlock:(void (^)())clickOkBtnBlock clickCancleBtnBlock:(void (^)())clickCancleBtnBlock;


/**隐藏View*/
+(void)dissMissView;
