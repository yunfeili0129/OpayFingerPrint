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
    if (allowd!=nil) {
        pt.allowd=allowd;
    }
    if (profileUrl!=nil) {
        pt.profileUrl=profileUrl;
    }
    if (partner!=nil) {
        pt.partner=partner;
    }
    if (appName!=nil) {
        pt.appName=appName;
    }
    if (timeLimit!=nil) {
        pt.timeLimit=timeLimit;
    }
    return pt;
}

@end
