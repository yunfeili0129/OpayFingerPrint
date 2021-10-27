//
//  OpayDeviceOptions.m
//  OpayDeviceDemo
//
//  Created by opay on 2021/10/25.
//

#import "OpayDeviceOptions.h"

@implementation OpayDeviceOptions

+(OpayDeviceOptions *)initWithAllowd:(NSString *)allowd profileUrl:(NSString *)profileUrl partner:(NSString *)partner appName:(NSString *)appName timeLimit:(NSString *)timeLimit
{
    OpayDeviceOptions *pt=[[OpayDeviceOptions alloc]init];
        pt.allowd=allowd;
        pt.profileUrl=profileUrl;
        pt.partner=partner;
        pt.appName=appName;
        pt.timeLimit=timeLimit;
    return pt;
}

@end
