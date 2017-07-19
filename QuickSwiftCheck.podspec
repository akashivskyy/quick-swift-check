#
# QuickSwiftCheck.podspec
#
# Copyright © 2017 Adrian Kashivskyy. All rights reserved.
# Licensed under the MIT License.
#

Pod::Spec.new do |spec|

  # Description

  spec.name = 'QuickSwiftCheck'
  spec.version = '1.0.0'
  spec.summary = 'Quick + Nimble + SwiftCheck'
  spec.homepage = 'https://github.com/akashivskyy/QuickSwiftCheck'

  # Author

  spec.authors = 'Adrian Kashivskyy'
  spec.social_media_url = 'https://twitter.com/akashivskyy'

  # License

  spec.license = {
    type: 'MIT',
    file: 'LICENSE.md'
  }

  # Source

  spec.source = {
    git: 'https://github.com/akashivskyy/QuickSwiftCheck.git',
    tag: spec.version.to_s
  }

  spec.source_files = 'QuickSwiftCheck/Sources'

  # Dependencies

  spec.dependency 'Quick', '~> 1.0'
  spec.dependency 'Nimble', '~> 7.0'
  spec.dependency 'SwiftCheck', '~> 0.8'

  # Linking

  spec.frameworks = 'XCTest'

  # Settings

  spec.requires_arc = true

  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.10'
  spec.tvos.deployment_target = '9.0'

end
