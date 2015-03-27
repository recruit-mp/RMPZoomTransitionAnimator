//
//  DemoCollectionViewController.m
//  RMPZoomTransitionAnimator
//
//  Created by Masato OSHIMA on 2015/03/27.
//  Copyright (c) 2015年 Masato Ohshima. All rights reserved.
//

#import "DemoCollectionViewController.h"

@interface ImageCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation ImageCell

@end

@interface DemoCollectionViewController ()

@property (nonatomic, copy) NSArray *images;

@end

@implementation DemoCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static const NSUInteger kImageCount = 16;

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
    for (int i = 1; i <= kImageCount ; i++) {
        NSString *filename = [NSString stringWithFormat:@"%d.jpeg", i];
        [images addObject:[UIImage imageNamed:filename]];
    }
    self.images = [images copy];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 16;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSString *filename = [NSString stringWithFormat:@"%ld.jpeg", indexPath.row + 1];
    UIImage *image = [UIImage imageNamed:filename];
    cell.imageView.image = image;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
