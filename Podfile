# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'



def frameworks
  pod 'RxSwift', '6.1.0'
  pod 'RxCocoa', '6.1.0'
end

def test_frameworks
  pod 'RxBlocking', '6.1.0'
  pod 'RxTest', '6.1.0'
end

target 'TodoList' do
  use_frameworks!
  frameworks
end

target 'TodoListTests' do
  inherit! :search_paths
  frameworks
  test_frameworks
end
