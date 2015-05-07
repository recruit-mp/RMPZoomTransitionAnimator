//  Copyright (c) 2015 Recruit Marketing Partners Co.,Ltd. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "DetailPadViewController.h"

@interface DetailPadViewController ()

@property (nonatomic, weak) IBOutlet UITextView *descriptionView;

@end

@implementation DetailPadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self resizeView];
}

- (void)viewDidLayoutSubviews
{
    [self resizeView];
}

#pragma mark - 

- (void)resizeView
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    BOOL isLandscape = UIInterfaceOrientationIsLandscape(orientation);
    
    // we set fixed frame without auto layout so iPad has fixed display size.
    self.mainImageView.frame = CGRectMake(16, 82, 736, 552);
    if (isLandscape) {
        self.titleLabel.frame = CGRectMake(802, 82, 206, 54);
        self.descriptionView.frame = CGRectMake(802, 144, 206, 604);
    } else {
        self.titleLabel.frame = CGRectMake(16, 656, 144, 54);
        self.descriptionView.frame = CGRectMake(16, 746, 736, 254);
    }
}

@end
