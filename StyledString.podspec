Pod::Spec.new do |s|
  s.name             = "StyledString"
  s.version          = "0.4.2"
  s.summary          = "String styling in Swift"

  s.description      = <<-DESC
  Easy creation of NSAttributedStrings with Swift. 
                       DESC

  s.homepage         = "https://github.com/Q42/StyledString"
  s.license          = 'MIT'
  s.author           = { "Sander de Vos" => "sander@q42.nl" }
  s.source           = { :git => "https://github.com/Q42/StyledString.git", :tag => s.version.to_s }
  s.requires_arc     = true

  s.ios.deployment_target = '8.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'Sources/**/*'

end
