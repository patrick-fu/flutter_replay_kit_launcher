#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint replay_kit_launcher.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'replay_kit_launcher'
  s.version          = '0.3.0'
  s.summary          = 'A flutter plugin of the launcher used to open RPSystemBroadcastPickerView for iOS'
  s.description      = <<-DESC
A flutter plugin of the launcher used to open RPSystemBroadcastPickerView for iOS
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
