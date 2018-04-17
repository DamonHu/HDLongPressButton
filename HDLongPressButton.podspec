Pod::Spec.new do |s|
s.name = 'HDLongPressButton'
s.version = '1.0.0'
s.license= { :type => "MIT", :file => "LICENSE" }
s.summary = 'HDLongPressButton,长按动态按钮'
s.homepage = 'https://github.com/DamonHu/HDLongPressButton'
s.authors = { 'DamonHu' => 'dong765@qq.com' }
s.source = { :git => "https://github.com/DamonHu/HDLongPressButton.git", :tag => s.version}
s.requires_arc = true
s.ios.deployment_target = '9.0'
s.source_files = "HDLongPressButton/HDLongPressButton/*.{h,m}"
s.frameworks = 'UIKit','Foundation'
end