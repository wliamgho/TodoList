# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
inhibit_all_warnings!

def tests_pods
  pod 'RxTest', '~> 5.1'
  pod 'RxBlocking', '~> 5.1'
  pod 'Nimble'
end

target 'TodoList' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TodoList
  pod "TinyConstraints"
  pod 'RxSwift'
  pod 'RxCocoa'

  target 'TodoListTests' do
    inherit! :search_paths

    tests_pods
  end

  target 'TodoListUITests' do
    # Pods for testing
    tests_pods
  end

end
