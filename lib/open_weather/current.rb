module OpenWeather
  class Current < Base
    def initialize(options = {})
      super(API_URL + '/weather', options)
    end
  end
end
