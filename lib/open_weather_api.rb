module OpenWeather
  $LOAD_PATH<< "../lib"

  autoload :Base,    "open_weather_api/base"
  autoload :Current, "open_weather_api/current"
  autoload :Forecast, "open_weather_api/forecast"
  autoload :VERSION, "open_weather_api/version"

  require "open_weather_api/api.rb"
end
