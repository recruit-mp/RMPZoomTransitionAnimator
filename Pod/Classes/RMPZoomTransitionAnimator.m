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

#import "RMPZoomTransitionAnimator.h"

@implementation RMPZoomTransitionAnimator

// constants for transition animation
static const NSTimeInterval kForwardAnimationDuration         = 0.3;
static const NSTimeInterval kForwardCompleteAnimationDuration = 0.2;
static const NSTimeInterval kBackwardAnimationDuration         = 0.25;
static const NSTimeInterval kBackwardCompleteAnimationDuration = 0.18;

#pragma mark - <UIViewControllerAnimatedTransitioning>

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    if (self.goingForward) {
        return kForwardAnimationDuration + kForwardCompleteAnimationDuration;
    } else {
        return kBackwardAnimationDuration + kBackwardCompleteAnimationDuration;
    }
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // Setup for animation transition
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView    = [transitionContext containerView];
    [containerView addSubview:fromVC.view];
    [containerView addSubview:toVC.view];
    
    // Without animation when you have not confirm the protocol
    Protocol *animating = @protocol(RMPZoomTransitionAnimating);
    BOOL doesNotConfirmProtocol = ![self.sourceTransition conformsToProtocol:animating] || ![self.destinationTransition conformsToProtocol:animating];
    if (doesNotConfirmProtocol) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        return;
    }
    
    // Add a alphaView To be overexposed, so background becomes dark in animation
    UIView *alphaView = [[UIView alloc] initWithFrame:[transitionContext finalFrameForViewController:toVC]];
    alphaView.backgroundColor = [self.sourceTransition transitionSourceBackgroundColor];
    [containerView addSubview:alphaView];
    
    // Transition source of image to move me to add to the last
    UIImageView *sourceImageView = [self.sourceTransition transitionSourceImageView];
    [containerView addSubview:sourceImageView];
    
    if (self.goingForward) {
        [UIView animateWithDuration:kForwardAnimationDuration
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             sourceImageView.frame = [self.destinationTransition transitionDestinationImageViewFrame];
                             sourceImageView.transform = CGAffineTransformMakeScale(1.02, 1.02);
                             alphaView.alpha = 0.9;
                         }
                         completion:^(BOOL finished) {
                             [UIView animateWithDuration:kForwardCompleteAnimationDuration
                                                   delay:0
                                                 options:UIViewAnimationOptionCurveEaseOut
                                              animations:^{
                                                  alphaView.alpha = 0;
                                                  sourceImageView.transform = CGAffineTransformIdentity;
                                              }
                                              completion:^(BOOL finished) {
                                                  sourceImageView.alpha = 0;
                                                  if ([self.destinationTransition conformsToProtocol:@protocol(RMPZoomTransitionAnimating)] &&
                                                      [self.destinationTransition respondsToSelector:@selector(zoomTransitionAnimator:didCompleteTransition:animatingSourceImageView:)]) {
                                                      [self.destinationTransition zoomTransitionAnimator:self
                                                                                   didCompleteTransition:![transitionContext transitionWasCancelled]
                                                                                animatingSourceImageView:sourceImageView];
                                                  }
                                                  [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                                                  
                                                  // Remove the views from superviews to release the references
                                                  [alphaView removeFromSuperview];
                                                  [sourceImageView removeFromSuperview];
                                              }];
                         }];
        
    } else {
        [UIView animateWithDuration:kBackwardAnimationDuration
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             sourceImageView.frame = [self.destinationTransition transitionDestinationImageViewFrame];
                             alphaView.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             [UIView animateWithDuration:kBackwardCompleteAnimationDuration
                                                   delay:0
                                                 options:UIViewAnimationOptionCurveEaseOut
                                              animations:^{
                                                  sourceImageView.alpha = 0;
                                              }
                                              completion:^(BOOL finished) {
                                                  if ([self.destinationTransition conformsToProtocol:@protocol(RMPZoomTransitionAnimating)] &&
                                                      [self.destinationTransition respondsToSelector:@selector(zoomTransitionAnimator:didCompleteTransition:animatingSourceImageView:)]) {
                                                      [self.destinationTransition zoomTransitionAnimator:self
                                                                                   didCompleteTransition:![transitionContext transitionWasCancelled]
                                                                                animatingSourceImageView:sourceImageView];
                                                  }
                                                  [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                                                  if(![[UIApplication sharedApplication].keyWindow.subviews containsObject:toVC.view]) {
                                                      [[UIApplication sharedApplication].keyWindow addSubview:toVC.view];
                                                  }
                                                  // Remove the views from superviews to release the references
                                                  [alphaView removeFromSuperview];
                                                  [sourceImageView removeFromSuperview];
                                              }];
                         }];
    }
}

@end
