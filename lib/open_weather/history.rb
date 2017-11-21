module OpenWeather
  class History < Base
    def initialize options = {}
      super('http://history.openweathermap.org/data/2.5/history/city', options)
    end
  end
end
