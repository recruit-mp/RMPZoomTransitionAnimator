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
  s.version          = "1.0.0"
  s.summary          = "A custom zooming transition animation for UIViewController"
  s.description      = <<-DESC
                       `RMPZoomTransitionAnimator`

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/recruit-mp/RMPZoomTransitionAnimator"
  s.screenshots      = "https://raw.githubusercontent.com/recruit-mp/RMPZoomTransitionAnimator/master/docs/rmpscrollingmenubarcontroller.gif"
  s.license          = 'MIT'
  s.author           = { "Recruit Marketing Partners Co.,Ltd." => "recruit_mp_oss@ml.cocorou.jp" }
  s.source           = { :git => "https://github.com/recruit-mp/RMPZoomTransitionAnimator.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'RMPZoomTransitionAnimator' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
