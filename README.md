## A ruby wrapper for Open Weather Map API.

## Installation

Add the following to your **Gemfile**

    gem 'open_weather'

  or

    $ gem install open_weather

## Usage

    require 'open_weather'

    # current weather APIs

    # get current weather by city name
    OpenWeather::Current.city("Cochin, IN")

    # get current weather by city id
    OpenWeather::Current.city_id("1273874")

    # get current weather by geocode. (lat, lon)
    OpenWeather::Current.geocode(9.94, 76.26)

    # weather forecast APIs

    # get weather forecast by city name
    OpenWeather::Forecast.city("Cochin, IN")

    # get weather forecast by city id
    OpenWeather::Forecast.city_id("1273874")

    # get weather forecast by geocode. (lat, lon)
    OpenWeather::Forecast.geocode(9.94, 76.26)
 
## Contributing 

  Fork it
  Create your feature branch (git checkout -b my-new-feature)
  Commit your changes (git commit -am 'Added some feature')
  Push to the branch (git push origin my-new-feature)
  Create new Pull Request