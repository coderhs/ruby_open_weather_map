module OpenWeather
  class Forecast < Base
    def initialize options = {}
      super('http://api.openweathermap.org/data/2.5/forecast', options)
    end
  end
end
