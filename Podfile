use_frameworks!

def common_pods
    pod 'Yams'
    pod 'SwiftLint'
end

def common_tests_pods
    common_pods

    pod 'Quick'
    pod 'Nimble'
end

target 'SwaggerKit iOS' do
    platform :ios, '10.0'

    common_pods
end

target 'SwaggerKit macOS' do
    platform :macos, '10.12'

    common_pods
end

target 'SwaggerKit tvOS' do
    platform :tvos, '10.0'

    common_pods
end

target 'SwaggerKit Tests iOS' do
    inherit! :search_paths
    platform :ios, '10.0'

    common_tests_pods
end

target 'SwaggerKit Tests macOS' do
    inherit! :search_paths
    platform :macos, '10.12'

    common_tests_pods
end

target 'SwaggerKit Tests tvOS' do
    inherit! :search_paths
    platform :tvos, '10.0'

    common_tests_pods
end
