module OpenWeather
  class ForecastDaily < Base
    def initialize options = {}
      super(API_URL + '/forecast/daily', options)
    end
  end
end
