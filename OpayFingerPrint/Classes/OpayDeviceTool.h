//
//  OpayDeviceTool.h
//  OpayDeviceDemo
//
//  Created by opay on 2021/10/25.
//

#import <Foundation/Foundation.h>
#import "OpayDeviceOptions.h"
@class OpayDeviceOptions;
NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    initStatusFail,//上传失败
    initStatusSucess,//SDK初始化成功，此时可以获取到正常的blackBox
    initStatusUninit,//尚未调⽤用init⽅方法，此时不不可获取blackBox
    initStatusCollecting,//设备信息采集中
    initStatusProfiling,//设备信息采集完毕，正在上传
    initStatusUnkown//未知
} initStatus;
@protocol  OpayDeviceToolProtocol<NSObject>

@required

-(void)startCallBack:(NSString*)blackBox;

@end

@interface OpayDeviceTool : NSObject

+(instancetype)instance;

-(void)startOptions:(OpayDeviceOptions*)options delegate:(id)delegate;

-(NSString *)getDeviceBlackBox;

-(initStatus)getDeviceStatus;

-(void)upload:(NSString *)url blackBox:(NSString *)blackBox deviceId:(NSString *)deviceId userId:(NSString *)userId;

@property(nonatomic,weak)id<OpayDeviceToolProtocol>delegate;

@end

NS_ASSUME_NONNULL_END
