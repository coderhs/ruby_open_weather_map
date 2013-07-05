module OpenWeather
  $LOAD_PATH<< "../lib"

  autoload :Base,    "open_weather_api/base"
  autoload :Current, "open_weather_api/current_weather"
  autoload :VERSION, "open_weather_api/version"
end
