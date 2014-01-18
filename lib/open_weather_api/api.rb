require_relative 'current_weather'

module OpenWeather
  class Current
    #City format : Eg, Cochin,IN
    #Useage: OpenWeather::Current.city('Cochin,In')
    def self.city(city, options = {})
      new(options.merge(city: city)).retrive
    end

    #City Id, an integer value. Eg, 2172797
    #Useage: OpenWeather::Current.city_id(2172797)
    def self.city_id(id, options = {})
      new(options.merge(id: id)).retrive
    end

    #City Geographics Cordingates : Eg, lat 35 lon 139
    def self.geocode(lat, lon, options = {})
      new(options.merge(lat: lat, lon: lon)).retrive
    end
 end
end
