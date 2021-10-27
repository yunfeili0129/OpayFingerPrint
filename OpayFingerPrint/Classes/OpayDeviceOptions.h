//
//  OpayDeviceOptions.h
//  OpayDeviceDemo
//
//  Created by opay on 2021/10/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpayDeviceOptions : NSObject
@property(nonatomic,copy)NSString *allowd;
@property(nonatomic,copy)NSString *profileUrl;
@property(nonatomic,copy)NSString *partner;
@property(nonatomic,copy)NSString *appName;
@property(nonatomic,copy)NSString *timeLimit;
+(OpayDeviceOptions *)initWithAllowd:(NSString *)allowd profileUrl:(NSString *)profileUrl partner:(NSString *)partner appName:(NSString *)appName timeLimit:(NSString *)timeLimit;
@end

NS_ASSUME_NONNULL_END
