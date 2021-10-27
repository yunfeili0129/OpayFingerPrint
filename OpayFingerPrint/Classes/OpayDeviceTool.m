//
//  OpayDeviceTool.m
//  OpayDeviceDemo
//
//  Created by opay on 2021/10/25.
//

#import "OpayDeviceTool.h"
#import "FMDeviceManager.h"
@interface OpayDeviceTool()
{
    FMDeviceManager_t *manager;
}
@end
@implementation OpayDeviceTool
+ (instancetype)instance
{
    static dispatch_once_t onceToken;
    static OpayDeviceTool *sharedManager = nil;
    if (sharedManager==nil) {
            dispatch_once(&onceToken, ^{
                sharedManager = [[OpayDeviceTool  alloc] init];
            });
    }
    return sharedManager;
    
}
-(void)startOptions:(OpayDeviceOptions*)options delegate:(id)delegate
{
    _delegate=delegate;
    __weak typeof(self)weakSelf=self;
    manager = [FMDeviceManager sharedManager];
    // 准备SDK初始化参数
    NSMutableDictionary *optionDic = [NSMutableDictionary dictionary];
    /*
    * SDK具有反调试功能，当使⽤用xcode调试时(开发测试阶段),请取消下⾯面的代码注释,
    * 关闭反调试功能,否则使⽤用xcode调试会闪退。上架打包的时候需要删除或者注释掉这
    * ⾏行行代码来开启反调试功能,这样能保护APP不不容易易被调试。 */
    //[optionDic setValue:options.allowd forKey:@"allowd"];  // TODO
    // 指定线上环境的url
    [optionDic setValue:options.profileUrl forKey:@"profileUrl"]; // TODO
    // 此处替换为您的合作⽅方标识
    [optionDic setValue:options.partner forKey:@"partner"];
    // 此处替换为您的渠道名
    [optionDic setValue:options.appName forKey:@"appName"];
    /*
    * 若需要通过回调⽅方式获取blackBox, 请在初始化参数中添加回调block
    * SDK初始化完成，⽣生成blackBox的时候就会⽴立即触发此回调 */
    [optionDic setObject:^(NSString *blackBox){
    //添加你的回调逻辑 若服务端出现异常如licence过期，则会返回如下内容(如:{"cod e":"104","desc":"licence不不合法"})
        if ([weakSelf.delegate respondsToSelector:@selector(startCallBack:)]) {
            [weakSelf.delegate startCallBack:blackBox];
        }
    } forKey:@"callback"];
    //设置超时时间(单位:秒)
    [options setValue:options.timeLimit forKey:@"timeLimit"];
    // 使⽤用上述参数进⾏行行SDK初始化
    manager->initWithOptions(optionDic);
}
-(initStatus)getDeviceStatus
{
    initStatus status;
    NSString * managerInitStatus = manager->getInitStatus();
    if ([managerInitStatus isEqualToString:@"collecting"]) {
        status=initStatusCollecting;
    }
    else if ([managerInitStatus isEqualToString:@"profiling"]){
        status=initStatusProfiling;
    }
    else if ([managerInitStatus isEqualToString:@"successful"]){
        status=initStatusSucess;
    }
    else if ([managerInitStatus isEqualToString:@"failed"]){
        status=initStatusFail;
    }
    else {
        status=initStatusUnkown;
    }
    return status;
}
-(NSString *)getDeviceBlackBox
{
    NSString *blackBox = manager->getDeviceInfo();
    NSLog(@"同盾设备指纹数据: %@", blackBox);
    return blackBox;
}
-(void)uploadBlackBox:(NSString *)url blackBox:(NSString *)blackBox deviceId:(NSString *)deviceId userId:(NSString *)userId
{
    NSMutableDictionary *mdic=[NSMutableDictionary dictionary];
    if (userId!=nil) {
        [mdic setValue:userId forKey:@"userId"];
    }
    if (deviceId!=nil) {
        [mdic setValue:deviceId forKey:@"deviceId"];
    }
    if (blackBox!=nil) {
        [mdic setValue:blackBox forKey:@"blackBox"];
    }
}
@end
