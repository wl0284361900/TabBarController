//
//  RedViewController.m
//  TabBarController
//
//  Created by winproluhao on 2020/11/2.
//

#import "RedViewController.h"
#import "SecondViewController.h"
@interface RedViewController ()

@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"RedView";
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"barbuttonicon_add"] style:UIBarButtonItemStylePlain target:self action:@selector(didClickNextView)];
}

- (void)didClickNextView{
    SecondViewController *view = [[SecondViewController alloc]init];
    
    //如果要隱藏TabBar的話，可加入下面這行
//    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];
}
@end

