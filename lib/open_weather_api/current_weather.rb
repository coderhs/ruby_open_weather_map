module OpenWeather
  class Current < Base

    @api_url = 'http://api.openweathermap.org/data/2.5/weather'
    
    #format : Cochin,IN
    def self.city(city, options = { })
      query = Hash.new 
      query[:q] = city
      send_request query.merge!(options), @api_url
    end
  end
end



