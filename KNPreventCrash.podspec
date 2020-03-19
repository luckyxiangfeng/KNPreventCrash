

Pod::Spec.new do |spec|

  spec.name         = "KNPreventCrash"
  spec.version      = "0.0.1"
  spec.summary      = "防止崩溃"


  spec.description  = <<-DESC
                    iOS防止找不到对象或者空类型崩溃
                   DESC

  spec.homepage     = "https://github.com/luckyxiangfeng/KNPreventCrash.git"

  spec.license      = "MIT"


  spec.author             = { "Ken" => "ulxiping@aliyun.com" }
  
  spec.platform     = :ios, "8.0"
  
  spec.ios.deployment_target = "8.0"
  
  spec.source       = { :git => "https://github.com/luckyxiangfeng/KNPreventCrash.git", :tag => "#{spec.version}" }

  spec.source_files  = "KNPreventCrashDemo", "KNPreventCrashDemo/KNPreventCrashDemo/KNPreventCrash/*.{h,m}"
  spec.frameworks = 'UIKit','Foundation','runtime'

end
