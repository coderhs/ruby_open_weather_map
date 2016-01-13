module OpenWeather
  class History < Base
    def initialize options = {}
      super('http://api.openweathermap.org/data/2.5/history', options)
    end
  end
end
