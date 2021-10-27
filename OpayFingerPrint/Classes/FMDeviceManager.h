//
//  FMDeviceManager.h
//  FMDeviceManager
//
//  Copyright (c) 2016年 Tongdun.inc. All rights reserved.
//

#define FM_SDK_VERSION @"3.3.4"

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


typedef struct _void {
    void (*initWithOptions)(NSDictionary *);
    NSString *(*getDeviceInfo)(void);
    NSString *(*getInitStatus)(void);
    NSDictionary *(*getConfigInfo)(void);
} FMDeviceManager_t;

@interface FMDeviceManager : NSObject

+ (FMDeviceManager_t *) sharedManager;
+ (void) destroy;

@end

