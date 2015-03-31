# RMPZoomTransitionAnimator

[![Version](https://img.shields.io/cocoapods/v/RMPZoomTransitionAnimator.svg?style=flat)](http://cocoapods.org/pods/RMPZoomTransitionAnimator)
[![License](https://img.shields.io/cocoapods/l/RMPZoomTransitionAnimator.svg?style=flat)](http://cocoapods.org/pods/RMPZoomTransitionAnimator)
[![Platform](https://img.shields.io/cocoapods/p/RMPZoomTransitionAnimator.svg?style=flat)](http://cocoapods.org/pods/RMPZoomTransitionAnimator)

## Overview

`RMPZoomTransitionAnimator` provide a custom transition zooming animation.

Not only `UICollectionViewController`, it is possible to use any other `UIViewController`.

![Screen shot](docs/RMPZoomTransitionAnimator.gif)

## Installation

RMPZoomTransitionAnimator is available through [CocoaPods](http://cocoapods.org).   
To install
it, simply add the following line to your Podfile:

```ruby
pod "RMPZoomTransitionAnimator"
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Setup is as below:

### Use for a UINavigationController push transition

- Import `RMPZoomTransitionAnimator.h`
- Adopt `RMPZoomTransitionAnimating`
- Implement the `RMPZoomTransitionAnimating` protocol to source view controller and destination view controller

```objective-c
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
```

- Returns RMPZoomTransitionAnimator instance in the UINavigationController delegate method

```objective-c
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    RMPZoomTransitionAnimator *animator = [[RMPZoomTransitionAnimator alloc] init];
    animator.goingForward = (operation == UINavigationControllerOperationPush);
    animator.sourceTransition = (id<RMPZoomTransitionAnimating>)fromVC;
    animator.destinationTransition = (id<RMPZoomTransitionAnimating>)toVC;
    return animator;
}
```

### Use for a modal transition

- Import RMPZoomTransitionAnimator.h
- Adopt RMPZoomTransitionAnimating
- Implement RMPZoomTransitionAnimating protocol
- Set the transitioningDelegate in `prepareForSegue:sender`:
- Returns RMPZoomTransitionAnimator instance in the UIViewControllerTransitioningDelegate method

```objective-c
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    RMPZoomTransitionAnimator *animator = [[RMPZoomTransitionAnimator alloc] init];
    animator.goingForward = YES;
    animator.sourceTransition = (id<RMPZoomTransitionAnimating>)source;
    animator.destinationTransition = (id<RMPZoomTransitionAnimating>)presented;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    RMPZoomTransitionAnimator *animator = [[RMPZoomTransitionAnimator alloc] init];
    animator.goingForward = NO;
    animator.sourceTransition = (id<RMPZoomTransitionAnimating>)dismissed;
    animator.destinationTransition = (id<RMPZoomTransitionAnimating>)self;
    return animator;
}
```

## Requirements

- iOS 7.0 or higher 

## Contribution

If you have feature requests or bug reports, feel free to help out by sending pull requests or by creating new issues.

## Author

Recruit Marketing Partners Co.,Ltd. recruit_mp_oss@ml.cocorou.jp

## License

RMPZoomTransitionAnimator is available under the MIT license.
