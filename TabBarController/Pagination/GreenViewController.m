//
//  GreenViewController.m
//  TabBarController
//
//  Created by winproluhao on 2020/11/2.
//

#import "GreenViewController.h"

@interface GreenViewController ()

@end

@implementation GreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"GreenView";
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"barbuttonicon_phone"] style:UIBarButtonItemStylePlain target:self action:@selector(callPhone:)];
}

- (void)callPhone:(UIButton *)sender{
    NSLog(@"call phone");
}
@end
