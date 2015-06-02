Pod::Spec.new do |s|
  s.name         = "MLDownloadImageView"
  s.version      = "1.0"
  s.summary      = "An simple download image component for iOS."
  s.homepage     = "https://github.com/marcoslacerda/MLDownloadImageView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Marcos Lacerda' => 'marcos.reis.appledeveloper@gmail.com' }
  s.source       = { :git => "https://github.com/marcoslacerda/MLDownloadImageView.git", tag: '1.0' }
  s.platform     = :ios
  s.source_files = 'MLDownloadImageView/*.{h,m}'
  s.requires_arc = true
end