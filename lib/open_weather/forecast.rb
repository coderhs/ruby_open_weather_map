module OpenWeather
  class Forecast < Base
    def initialize options = {}
      super(API_URL + '/forecast', options)
    end
  end
end
