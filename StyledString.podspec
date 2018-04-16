Pod::Spec.new do |s|
  s.name             = "StyledString"
  s.version          = "0.6.0"
  s.summary          = "String styling in Swift"

  s.description      = <<-DESC
  Easy creation of NSAttributedStrings with Swift. 
                       DESC

  s.homepage         = "https://github.com/Q42/StyledString"
  s.license          = 'MIT'
  s.author           = { "Sander de Vos" => "sander@q42.nl" }
  s.source           = { :git => "https://github.com/Q42/StyledString.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Sources/**/*'

end
