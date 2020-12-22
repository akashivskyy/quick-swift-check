# QuickSwiftCheck.podspec
# Copyright © 2020 Adrian Kashivskyy. All rights reserved.

Pod::Spec.new do |spec|

  spec.name = 'QuickSwiftCheck'
  spec.version = '3.1.0'
  spec.summary = 'Quick + Nimble + SwiftCheck'
  spec.homepage = 'https://github.com/akashivskyy/QuickSwiftCheck'

  spec.authors = 'Adrian Kashivskyy'
  spec.social_media_url = 'https://twitter.com/akashivskyy'

  spec.license = {
    type: 'MIT',
    file: 'LICENSE.txt'
  }

  spec.source = {
    git: 'https://github.com/akashivskyy/QuickSwiftCheck.git',
    tag: spec.version.to_s
  }

  spec.source_files = 'QuickSwiftCheck/Sources'

  spec.dependency 'Nimble', '~> 8.0'
  spec.dependency 'Quick', '~> 2.0'
  spec.dependency 'SwiftCheck', '~> 0.12'

  spec.frameworks = 'XCTest'

  spec.swift_version = '5.0'
  spec.requires_arc = true

  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.10'
  spec.tvos.deployment_target = '9.0'

end
