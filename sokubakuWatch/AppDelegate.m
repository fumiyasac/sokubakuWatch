//
//  AppDelegate.m
//  sokubakuWatch
//
//  Created by 酒井文也 on 2015/01/24.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//[WIP]WatchKitのハンドルリクエスト受け取り
- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void(^)(NSDictionary *replyInfo))reply
{
    //@todo:
    NSString *request = [userInfo objectForKey:@"requestString"];
    
    if ([request isEqualToString:@"executeMethodA"]) {
        // Do whatever you want to do when sent the message. For instance...
        NSLog(@"Success!");
    }
    
    // This is just an example of what you could return. The one requirement is
    // you do have to execute the reply block, even if it is just to 'reply(nil)'.
    // All of the objects in the dictionary [must be serializable to a property list file][3].
    // If necessary, you can covert other objects to NSData blobs first.
    NSArray *objects = [[NSArray alloc] initWithObjects:@"myObjectA", @"myObjectB", @"myObjectC", nil];
    NSArray *keys = [[NSArray alloc] initWithObjects:@"objectAName", @"objectBName", @"objectCName", nil];
    NSDictionary *replyContent = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
    
    reply(replyContent);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
