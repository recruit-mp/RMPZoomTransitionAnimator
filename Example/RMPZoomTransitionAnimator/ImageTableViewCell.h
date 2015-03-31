//
//  ImageTableViewCell.h
//  RMPZoomTransitionAnimator
//
//  Created by Masato OSHIMA on 2015/03/31.
//  Copyright (c) 2015年 Masato Ohshima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *thumbImageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end
