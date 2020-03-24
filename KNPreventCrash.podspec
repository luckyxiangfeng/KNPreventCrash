

Pod::Spec.new do |spec|

  spec.name         = "KNPreventCrash"
  spec.version      = "1.0.0"
  spec.summary      = "防止崩溃"


  spec.description  = <<-DESC
                    iOS防止找不到对象或者空类型崩溃
                   DESC

  spec.homepage     = "https://github.com/luckyxiangfeng/KNPreventCrash"

  spec.license      = "MIT"


  spec.author             = { "Ken" => "ulxiping@aliyun.com" }
  
  spec.platform     = :ios, "9.0"
  
  spec.ios.deployment_target = "9.0"
  
  spec.source       = { :git => "https://github.com/luckyxiangfeng/KNPreventCrash.git", :tag => "#{spec.version}" }

  spec.source_files  = 'KNPreventCrash/*.{h,m}'
  
  spec.frameworks = 'UIKit','Foundation'

end
