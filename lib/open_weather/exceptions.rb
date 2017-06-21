module OpenWeather

  # OpenWeather imposes a limit on the amount of city IDs requested at once,
  # see http://openweathermap.org/current
  class LocationsLimitExceeded < StandardError
    def initialize(msg="Too many city IDs requested at once")
      super
    end
  end

end
