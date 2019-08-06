//
//  AppDelegate.m
//  Zero
//
//  Created by apple on 2019/7/24.
//  Copyright © 2019 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "RecommendViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabbarController = [[UITabBarController alloc]init];
    
    NewsViewController *newsController = [[NewsViewController alloc]init];
    
    VideoViewController *videoController = [[VideoViewController alloc]init];
    
    RecommendViewController *recommendController = [[RecommendViewController alloc]init];
    
    UIViewController *mineController = [[UIViewController alloc]init];
    mineController.tabBarItem.title = @"我的";
    mineController.view.backgroundColor = [UIColor blueColor];
    mineController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    mineController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    [tabbarController setViewControllers:@[newsController,videoController,recommendController,mineController]];
    
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:tabbarController];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
