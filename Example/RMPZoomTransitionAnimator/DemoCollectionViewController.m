//
//  DemoCollectionViewController.m
//  RMPZoomTransitionAnimator
//
//  Created by Masato OSHIMA on 2015/03/27.
//  Copyright (c) 2015年 Masato Ohshima. All rights reserved.
//

#import "DemoCollectionViewController.h"
#import "DemoDetailViewController.h"

@interface ImageCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation ImageCell

@end

@interface DemoCollectionViewController ()<UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy) NSArray *images;

@end

@implementation DemoCollectionViewController

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 

- (void)setupData
{
    NSMutableArray *images = [NSMutableArray array];
    // we prepared 16 images for demo
    for (int i = 1; i <= 16 ; i++) {
        NSString *filename = [NSString stringWithFormat:@"%d.jpeg", i];
        [images addObject:[UIImage imageNamed:filename]];
    }
    self.images = [images copy];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DemoDetailViewController *vc = segue.destinationViewController;
    vc.index = [[[self.collectionView indexPathsForSelectedItems] firstObject] row];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.images count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSString *filename = [NSString stringWithFormat:@"%ld.jpeg", indexPath.row + 1];
    UIImage *image = [UIImage imageNamed:filename];
    cell.imageView.image = image;
    
    return cell;
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat length = (CGRectGetWidth(self.view.frame) / 2) - (kCellMargin * 2);
    return CGSizeMake(length, length);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, kCellMargin, kCellMargin, kCellMargin);
}

@end
