# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

def shared_pods
	use_frameworks!

	pod 'AlamofireImage', '~> 4.1'
  pod 'Moya', '~> 14.0'
  pod 'lottie-ios'

end

target 'testNews' do
  # Comment the next line if you don't want to use dynamic frameworks
shared_pods

  # Pods for testNews

  target 'testNewsTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'testNewsUITests' do
  	inherit! :search_paths
  end

end
