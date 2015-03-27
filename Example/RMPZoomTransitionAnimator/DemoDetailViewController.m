//
//  DemoDetailViewController.m
//  RMPZoomTransitionAnimator
//
//  Created by Masato OSHIMA on 2015/03/27.
//  Copyright (c) 2015年 Masato Ohshima. All rights reserved.
//

#import "DemoDetailViewController.h"

@interface DemoDetailViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *mainImageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end

@implementation DemoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *filename = [NSString stringWithFormat:@"%ld.jpeg", self.index + 1];
    UIImage *image = [UIImage imageNamed:filename];
    self.mainImageView.image = image;
    
    self.titleLabel.text = filename;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
