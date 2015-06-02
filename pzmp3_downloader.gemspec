spec = Gem::Specification.new do |s| 
  s.name = "pzmp3_downloader"
  s.version = "0.1"
  s.author = "Brian Díaz"
  s.email = "brian@briandiaz.me"
  s.homepage = "https://github.com/briandiaz/pzmp3_downloader"
  s.platform = Gem::Platform::RUBY
  s.description = "Downloads songs from pzmp3.com"
  s.summary = "Ruby wrapper that downloads songs from pzmp3.com"
  s.files = [
    "README.md",
    "lib/pzmp3_downloader.rb",
    "lib/song.rb",
    "pzmp3_downloader.gemspec",
    "spec/spec_helper.rb",
    "spec/song_spec.rb"
  ]
  s.add_dependency('nokogiri', '>= 1.4.0')
end