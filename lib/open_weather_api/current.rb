module OpenWeather
  class Current < Base
    def initialize(options = {})
      super("http://api.openweathermap.org/data/2.5/weather", options)
    end
  end
end
