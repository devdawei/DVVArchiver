

Pod::Spec.new do |s|

s.name         = 'DVVArchiver'
s.summary      = '将对象归档到本地目录的实用小工具。'
s.version      = '1.0.0'
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.authors      = { 'devdawei' => '2549129899@qq.com' }
s.homepage     = 'https://github.com/devdawei'

s.platform     = :ios
s.ios.deployment_target = '7.0'
s.requires_arc = true

s.source       = { :git => 'https://github.com/devdawei/DVVArchiver.git', :tag => s.version.to_s }

s.source_files = 'DVVArchiver/DVVArchiver/*.{h,m}'

s.frameworks = 'Foundation', 'UIKit'

end
