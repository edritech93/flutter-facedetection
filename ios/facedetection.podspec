#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint facedetection.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'facedetection'
  s.version          = '0.0.1'
  s.summary          = 'face detection using MLKit'
  s.description      = <<-DESC
face detection using MLKit
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'edritech' => 'yudiedrialviska@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'GoogleMLKit'
  s.dependency 'GoogleMLKit/FaceDetection', '~> 2.6.0'
  s.platform = :ios, '10.0'
  s.static_framework = true

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
