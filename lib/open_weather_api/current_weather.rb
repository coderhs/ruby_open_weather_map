module OpenWeather
  class Current < Base

    @api_url = 'http://api.openweathermap.org/data/2.5/weather'
    
    #City format : Eg, Cochin,IN
    #Useage:  OpenWeather::Current.city('Cochin,In')
    def self.city(city, options = { })
      query = Hash.new 
      query[:q] = city
      send_request query.merge!(options), @api_url
    end

    #City Geographics Cordingates : Eg, lat 35 lon 139

    def self.geographic_cordinate(lat, lon, options = {})
      query = Hash.new 
      query[:lat] = lat
      query[:lon] = lon
      send_request query.merge!(options), @api_url
    end

    alias :geographic_cordinate :geocode

    #City Id, an integer value. Eg, 2172797
    #Useage: OpenWeather::Current.city_id(2172797)

    def self.city_id(city_id, options = {})
      query = Hash.new 
      query[:id] = city_id
      send_request query.merge!(options), @api_url
    end
  end
end



