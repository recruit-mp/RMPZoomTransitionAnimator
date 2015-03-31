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

#import <UIKit/UIKit.h>

/**
 You need to adopt the RMPZoomTransitionAnimating protocol in source view controller and destination
 view controller to make transition animations.
 
 The animator get the image position from a view controller implemented this protocol.
 */
@protocol RMPZoomTransitionAnimating <NSObject>

@required

/**
 Before the animation occurs, return the UIImageView of transition source view controller.
 
 You should create a new UIImageView object again, so this UIImageView is moving.
 
 @return source view controller's UIImageView before transition.
 */
- (UIImageView *)transitionSourceImageView;

/**
 Return background color in source view controller.
 
 This color will be used for fade in animation.
 we recommend the background color of source view controller.
 
 @return source view controller's bacground color
 */
- (UIColor *)transitionSourceBackgroundColor;

/**
 Returns the UIImageView’s rectangle in a destination view controller.
 
 @return destination view controller's frame for UIImageView
 */
- (CGRect)transitionDestinationImageViewFrame;

@end

@interface RMPZoomTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/**
 A Boolean value that determines whether transition animation is going forward.
 */
@property (nonatomic) BOOL goingForward;

/**
 The animator's delegate for transition in source view controller.
 
 You need to set this property and implement the RMPZoomTransitionAnimating in source view controller.
*/
@property (nonatomic, weak) id <RMPZoomTransitionAnimating> sourceTransition;

/**
 The animator's delegate for transition in destination view controller.
 
 You need to set this property and implement the RMPZoomTransitionAnimating in destination view controller.
 */
@property (nonatomic, weak) id <RMPZoomTransitionAnimating> destinationTransition;

@end
