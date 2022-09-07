Pod::Spec.new do |s|
    s.name             = 'PirateLightClientKit'
    s.version          = '0.14.1-beta'
    s.summary          = 'Pirate Light Client wallet SDK for iOS'

    s.description      = <<-DESC
    Pirate Light Client wallet SDK for iOS
                         DESC

    s.homepage         = 'https://github.com/PirateNetwork/PirateLightClientKit'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = {
        'Francisco Gindre' => 'francisco.gindre@gmail.com',
        'Jack Grigg' => 'str4d@electriccoin.co',
        'Forge' => 'cryptoforge.cc@protonmail.com'
     }
    s.source           = { :git => 'https://github.com/PirateNetwork/PirateLightClientKit.git', :tag => s.version.to_s }

    s.source_files = 'Sources/PirateLightClientKit/**/*.{swift,h}'
    s.resource_bundles = { 'Resources' => 'Sources/PirateLightClientKit/Resources/*' }
    s.swift_version = '5.5'
    s.ios.deployment_target = '12.0'
    s.dependency 'gRPC-Swift', '~> 1.0'
    s.dependency 'SQLite.swift', '~> 0.12.2'
    s.dependency 'libpiratelc', '0.0.5'
    s.static_framework = true

end
