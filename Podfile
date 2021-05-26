# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

def frameworks
  pod 'RxSwift', '6.1.0'
  pod 'RxCocoa', '6.1.0'
end

def test_frameworks
  pod 'RxBlocking', '6.1.0'
  pod 'RxTest', '6.1.0'
end

target 'TodoList' do
  frameworks
  

  # Pods for TodoList
  target 'TodoListTests' do
    inherit! :search_paths
    # Pods for testing
    test_frameworks
  end
end
