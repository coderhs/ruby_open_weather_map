## Inviting maintainers

Kindly create an issue and tag me if you wish to become a maintainer. 


## A ruby wrapper for Open Weather Map API.

[![Build Status](https://travis-ci.org/coderhs/ruby_open_weather_map.svg?branch=master)](https://travis-ci.org/coderhs/ruby_open_weather_map)

## Installation

Latest version `0.12.0`

Add the following to your **Gemfile**

    gem 'open-weather'

  or

    $ gem install open-weather

## Usage


#### Getting and using the API key

How to get an API key and tips for an effective usage of the API:
http://openweathermap.org/appid


```ruby
# get current weather by city name
options = { units: "metric", APPID: "1111111111" }
OpenWeather::Current.city("Berlin, DE", options)
```

### Current weather information API


```ruby
require 'open_weather'

# get current weather by city name
OpenWeather::Current.city("Cochin, IN", options)

# get current weather by city id
OpenWeather::Current.city_id("1273874", options)

# get current weather by geocode. (lat, lon)
OpenWeather::Current.geocode(9.94, 76.26 , options)

# get current weather for a list of city ids
OpenWeather::Current.cities([524901, 703448, 2643743], options)

# get current weather for a bounding box
OpenWeather::Current.rectangle_zone(12, 32, 15, 37, 10, options)

# get current weather for cities around a point
OpenWeather::Current.circle_zone(55.5, 37.5, 10, options)

# By default temperature is returned in fahrenheit to get the current weather in degrees celsius use unit as follows.
options = { units: "metric", APPID: "1111111111" }
OpenWeather::Current.city("Cochin, IN", options)
```

Documentation about the current weather end-point:
http://openweathermap.org/current


### Weather forecast API

```ruby
require 'open_weather'

# get weather forecast by city name
OpenWeather::Forecast.city("Cochin, IN", options)

# get weather forecast by city name in fahrenheit
OpenWeather::Forecast.city("Cochin, IN", options)

# get weather forecast by city id
OpenWeather::Forecast.city_id("1273874", options)

# get weather forecast by geocode. (lat, lon)
OpenWeather::Forecast.geocode(9.94, 76.26, options)

# get daily weather forecast by city name
OpenWeather::ForecastDaily.city("Cochin, IN", options)

# get daily weather forecast by city name in fahrenheit
OpenWeather::ForecastDaily.city("Cochin, IN", options)

# get daily weather forecast by city id
OpenWeather::ForecastDaily.city_id("1273874", options)

# get daily weather forecast by geocode. (lat, lon)
OpenWeather::ForecastDaily.geocode(9.94, 76.26, options)

# get daily weather forecast for 6 days
options[:cnt] = 6
OpenWeather::ForecastDaily.city_id("1273874", options)
```

### Weather history API


```ruby
require 'open_weather'

# get weather history by city name
OpenWeather::History.city("Cochin, IN", options)

# get weather history by city id
OpenWeather::History.city_id("1273874", options)

# get weather history by geocode. (lat, lon)
OpenWeather::History.geocode(9.94, 76.26, options)
```

Doucumentation about the weather forecast end-point:
http://openweathermap.org/forecast



#### Multilingual support

```ruby
# get current weather in german
options[:lang] = "de"
OpenWeather::Current.city("Berlin, DE",options)
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
