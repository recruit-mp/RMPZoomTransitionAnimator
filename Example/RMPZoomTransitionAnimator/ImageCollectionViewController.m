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

#import "ImageCollectionViewController.h"
#import "ImageCollectionViewCell.h"
#import "DetailViewController.h"

@interface ImageCollectionViewController ()<UICollectionViewDelegateFlowLayout, UIViewControllerTransitioningDelegate>

@property (nonatomic, copy) NSArray *images;

@end

@implementation ImageCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static const CGFloat kCellMargin = 5;

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)setupData
{
    NSMutableArray *images = [NSMutableArray array];
    // we prepared 16 images for example
    for (int i = 1; i <= 16 ; i++) {
        NSString *filename = [NSString stringWithFormat:@"%02d_S.jpeg", i];
        NSDictionary *info = @{
                               @"filename": filename,
                               @"image"   : [UIImage imageNamed:filename]
                               };
        
        [images addObject:info];
    }
    self.images = [images copy];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *vc = segue.destinationViewController;
    NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] firstObject];
    vc.index = selectedIndexPath.row;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.images count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSDictionary *info = self.images[indexPath.row];
    cell.imageView.image = info[@"image"];
    cell.titleLabel.text = info[@"filename"];
    
    return cell;
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL isPad = [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
    CGFloat length = (CGRectGetWidth(self.view.frame) / 2) - (kCellMargin * 2);
    if (isPad) {
        // fixed size for iPad in landscape and portrait
        length = 256 - (kCellMargin * 2);
    }
    return CGSizeMake(length, length);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, kCellMargin, kCellMargin, kCellMargin);
}

@end
