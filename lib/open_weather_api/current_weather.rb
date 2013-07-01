module OpenWeather
  class Current < Base

    @api_url = 'http://api.openweathermap.org/data/2.5/weather'
    
    #format : Cochin,IN
    def self.city(city, options = { })
      query = Hash.new 
      query[:q] = city
      run_call query.merge!(options), @api_url
    end
  end
end