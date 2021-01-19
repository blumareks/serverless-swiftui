#Lab 3 - connecting a mobile app to serverless backend

## Step 1. adding the Cocoapods

Start with the `pod init`command - this command would create for your Podfile. You need to update the content of the Podfile, to add the support for `Apache Openwhisk`.

Here comes the Podfile:
```bash

# Uncomment the next line to define a global platform for your project
# platform :ios, '11.0'

target 'ServerlessButton' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ServerlessButton
   pod 'OpenWhisk', :git => 'https://github.com/apache/incubator-openwhisk-client-swift.git', :tag => '0.3.0'
   pod 'SwiftyJSON', '~> 4.0'

  target 'ServerlessButtonTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ServerlessButtonUITests' do
    # Pods for testing
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.0'
      end
    end
  end
  
end

```

Now run the `pod init` command to install the dependencies (`Apache OpenWhisk`). 

[!] Please close any current Xcode sessions and use `ServerlessButton.xcworkspace` for this project from now on.
Pod installation complete! There are 2 dependencies from the Podfile and 2 total pods installed.

Update the OpenWhisk credentials in the ContentView.swift file. Check the details in the book: https://www.apress.com/us/book/9781484258354
and the respective repositories: https://github.com/serverless-swift (iOS app has a hello world app, while chapter 6 has a full demo app).
