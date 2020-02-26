Pod::Spec.new do |spec|
    spec.name = "SwaggerKit"
    spec.version = "1.0.0-alpha.1"
    spec.summary = "A swifty parser for OpenAPI (Swagger) specs"

    spec.homepage = "https://github.com/almazrafi/SwaggerKit"
    spec.license = { :type => 'MIT', :file => 'LICENSE' }
    spec.author = { "Almaz Ibragimov" => "almazrafi@gmail.com" }
    spec.source = { :git => "https://github.com/almazrafi/SwaggerKit.git", :tag => "#{spec.version}" }

    spec.swift_version = '5.0'

    spec.source_files = 'Sources/**/*.swift'
    spec.frameworks = 'Foundation'

    spec.ios.deployment_target = "10.0"
    spec.osx.deployment_target = "10.12"
    spec.watchos.deployment_target = "3.0"
    spec.tvos.deployment_target = "10.0"

    spec.dependency 'Yams', '~> 2.0'
end
