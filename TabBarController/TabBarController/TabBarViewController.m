//
//  TabBarViewController.m
//  TabBarController
//
//  Created by winproluhao on 2020/11/2.
//

#import "TabBarViewController.h"
#import "RedViewController.h"
#import "GreenViewController.h"
#import "YellowViewController.h"
#import "BlueViewController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RedViewController *view1 = [[RedViewController alloc]init];
    view1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"test1"
                                                    image:[UIImage imageNamed:@"tabbar_mainframe"]
                                            selectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    GreenViewController *view2 = [[GreenViewController alloc]init];
    view2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"test2"
                                                    image:[UIImage imageNamed:@"tabbar_contacts"]
                                            selectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    YellowViewController *view3 = [[YellowViewController alloc]init];
    view3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"test3"
                                                    image:[UIImage imageNamed:@"tabbar_discover"]
                                            selectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    BlueViewController *view4 = [[BlueViewController alloc]init];
    view4.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"test4"
                                                    image:[UIImage imageNamed:@"tabbar_me"]
                                            selectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    
    self.viewControllers = @[
        [[UINavigationController alloc]initWithRootViewController:view1],
        [[UINavigationController alloc]initWithRootViewController:view2],
        [[UINavigationController alloc]initWithRootViewController:view3],
        [[UINavigationController alloc]initWithRootViewController:view4]
    ];
    self.selectedIndex = 0;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
