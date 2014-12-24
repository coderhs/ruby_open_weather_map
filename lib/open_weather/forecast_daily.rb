module OpenWeather
  class ForecastDaily < Base
    def initialize options = {}
      super('http://api.openweathermap.org/data/2.5/forecast/daily', options)
    end
  end
end
