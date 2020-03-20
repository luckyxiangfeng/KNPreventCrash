

Pod::Spec.new do |spec|

  spec.name         = "KNPreventCrash"
  spec.version      = "0.0.2"
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

  spec.source_files  = "KNPreventCrashDemo", "KNPreventCrashDemo/KNPreventCrashDemo/KNPreventCrash"
  
  spec.subspec 'KNPreventCrash' do |ss|
     ss.source_files = 'KNPreventCrashDemo/KNPreventCrash/*.{h,m}'
   end
  spec.frameworks = 'UIKit','Foundation'

end
