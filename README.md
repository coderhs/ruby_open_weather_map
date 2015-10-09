## A ruby wrapper for Open Weather Map API.

[![Build Status](https://travis-ci.org/coderhs/ruby_open_weather_map.svg?branch=master)](https://travis-ci.org/coderhs/ruby_open_weather_map)

## Installation

Latest version `0.12.0`

Add the following to your **Gemfile**

    gem 'open-weather'

  or

    $ gem install open-weather

## Usage


### Current weather information API

```ruby
require 'open_weather'

# get current weather by city name
OpenWeather::Current.city("Cochin, IN")

# get current weather by city id
OpenWeather::Current.city_id("1273874")

# get current weather by geocode. (lat, lon)
OpenWeather::Current.geocode(9.94, 76.26)

# get current weather for a list of city ids
OpenWeather::Current.cities([524901, 703448, 2643743])

# get current weather for a bounding box
OpenWeather::Current.rectangle_zone(12, 32, 15, 37, 10)

# get current weather for cities around a point
OpenWeather::Current.circle_zone(55.5, 37.5, 10)

# get the current weather in degrees celsius
OpenWeather::Current.city("Cochin, IN", units: 'metric')
```

Documentation about the current weather end-point:
http://openweathermap.org/current


### Weather forecast API

```ruby
require 'open_weather'

# get weather forecast by city name
OpenWeather::Forecast.city("Cochin, IN")

# get weather forecast by city name in fahrenheit
OpenWeather::Forecast.city("Cochin, IN", units: 'imperial')

# get weather forecast by city id
OpenWeather::Forecast.city_id("1273874")

# get weather forecast by geocode. (lat, lon)
OpenWeather::Forecast.geocode(9.94, 76.26)

# get daily weather forecast by city name
OpenWeather::ForecastDaily.city("Cochin, IN")

# get daily weather forecast by city name in fahrenheit
OpenWeather::ForecastDaily.city("Cochin, IN", units: 'imperial')

# get daily weather forecast by city id
OpenWeather::ForecastDaily.city_id("1273874")

# get daily weather forecast by geocode. (lat, lon)
OpenWeather::ForecastDaily.geocode(9.94, 76.26)

# get daily weather forecast for 6 days
OpenWeather::ForecastDaily.city_id("1273874", cnt: 6)
```

Doucumentation about the weather forecast end-point:
http://openweathermap.org/forecast

#### Using the API key

```ruby
# get current weather by city name
options = { units: "metric", APPID: 1111111111 }
OpenWeather::Current.city("Berlin, DE", options)
```

How to get an API key and tips for an effective usage of the API:
http://openweathermap.org/appid

#### Multilingual support

```ruby
# get current weather in german
OpenWeather::Current.city("Berlin, DE", lang: "de")
```

Available languages are listed at:
http://openweathermap.org/current#multi


## Contributing

  Fork it

  Create your feature branch (git checkout -b my-new-feature)

  Commit your changes (git commit -am 'Added some feature')

  Push to the branch (git push origin my-new-feature)

  Create new Pull Request

--------

**This gem was created during the Hacker Saturdays hosted by [Kerala/Kochi Ruby Users Group](https://krug.github.io)**
