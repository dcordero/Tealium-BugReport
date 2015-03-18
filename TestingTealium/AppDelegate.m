//
//  AppDelegate.m
//  TestingTealium
//
//  Created by David Cordero on 18/03/15.
//  Copyright (c) 2015 Schibsted Iberica. All rights reserved.
//

#import "AppDelegate.h"

#import <Appsee/Appsee.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self startAppseeTracking];
    return YES;
}

- (void)startAppseeTracking
{
    [Appsee setDebugToNSLog:NO];
    [Appsee start:@"3e64beb3593a4643878a22e156aeb4ca"];
}

@end
