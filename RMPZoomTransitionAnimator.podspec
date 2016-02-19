#
# Be sure to run `pod lib lint RMPZoomTransitionAnimator.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RMPZoomTransitionAnimator"
  s.version          = "1.0.2"
  s.summary          = "A custom zooming transition animation for UIViewController"
  s.description      = <<-DESC
`RMPZoomTransitionAnimator` provide a custom transition zooming animation.

Not only `UICollectionView`, this is possible to use any other `UIViewController` transition.
This transition animation is like the "Pinterest" animation, but this is very simple and small library.
                       DESC
  s.homepage         = "https://github.com/recruit-mp/RMPZoomTransitionAnimator"
  s.screenshots      = "https://raw.githubusercontent.com/recruit-mp/RMPZoomTransitionAnimator/master/docs/collectionview.gif"
  s.license          = 'MIT'
  s.author           = { "Recruit Marketing Partners Co.,Ltd." => "recruit_mp_oss@ml.cocorou.jp" }
  s.source           = { :git => "https://github.com/recruit-mp/RMPZoomTransitionAnimator.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'RMPZoomTransitionAnimator' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'UIKit'
end
