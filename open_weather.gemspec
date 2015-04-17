$:.push File.expand_path("../lib", __FILE__)
require 'open_weather/version'

Gem::Specification.new do |gem|
  gem.name                 = "open-weather"
  gem.version              = OpenWeather::VERSION
  gem.authors              = ["HsPS mailme@hsps.in", "Deepak deepakkumarnd@gmail.com"]
  gem.email                = ['mailme@hsps.in']
  gem.homepage             = "https://github.com/coderhs/ruby_open_weather_map"
  gem.summary              = %q{ A ruby wrapper for Open Weather Map API. }
  gem.description          = %q{ A ruby wrapper for Open Weather Map API. }
  gem.files                = `git ls-files`.split("\n")
  gem.test_files           = gem.files.grep(/^(spec|test|features)/)
  gem.executables          = gem.files.grep(/^bin/).map{ |f| File.basename(f) }
  gem.require_paths        = ["lib"]
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "vcr"
  gem.add_development_dependency "webmock"
  gem.add_runtime_dependency 'json'
end
