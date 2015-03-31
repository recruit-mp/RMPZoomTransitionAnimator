//
//  ImageTableViewController.m
//  RMPZoomTransitionAnimator
//
//  Created by Masato OSHIMA on 2015/03/31.
//  Copyright (c) 2015年 Masato Ohshima. All rights reserved.
//

#import "ImageTableViewController.h"
#import "ImageTableViewCell.h"
#import "DetailViewController.h"

@interface ImageTableViewController ()

@property (nonatomic, copy) NSArray *images;

@end

@implementation ImageTableViewController

static NSString * const reuseIdentifier = @"Cell";

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
    
    // Uncomment the following line to preserve selection between presentations.
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
    // we prepared 16 images for demo
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.images count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *info = self.images[indexPath.row];
    cell.thumbImageView.image = info[@"image"];
    cell.titleLabel.text = info[@"filename"];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    DetailViewController *vc = segue.destinationViewController;
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    vc.index = selectedIndexPath.row;
}

@end
