module OpenWeather
  $LOAD_PATH<< "../lib"

  autoload :Base,    "open_weather/base"
  autoload :Current, "open_weather/current"
  autoload :Forecast, "open_weather/forecast"
  autoload :VERSION, "open_weather/version"

  require "open_weather/api.rb"
end
