$:.push File.expand_path("../lib", __FILE__)
require 'open_weather_api/version'

Gem::Specification.new do |gem|
  gem.name                 = "open_weather_api"
  gem.version              = OpenWeather::VERSION
  gem.authors              = ["hsps", "deepak"]
  gem.email                = []
  gem.homepage             = "https://github.com/coderhs/ruby_open_weather_map"
  gem.summary              = %q{ A ruby wrapper for Open Weather Map API. }
  gem.description          = %q{ A ruby wrapper for Open Weather Map API. }
  gem.files                = `git ls-files`.split("\n")
  gem.test_files           = gem.files.grep(/^(spec|test|features)/)
  gem.executables          = gem.files.grep(/^bin/).map{ |f| File.basename(f) }
  gem.require_paths        = ["lib"]
  gem.add_development_dependency "rspec"
end