
module OpenWeather
  module ClassMethods
    #City format : Eg, Cochin,IN
    #Useage: OpenWeather::Current.city('Cochin,In')
    def city(city, options = {})
      new(options.merge(city: city)).retrive
    end

    #City Id, an integer value. Eg, 2172797
    #Useage: OpenWeather::Current.city_id(2172797)
    def city_id(id, options = {})
      new(options.merge(id: id)).retrive
    end

    #City Geographics Cordingates : Eg, lat 35 lon 139
    def geocode(lat, lon, options = {})
      new(options.merge(lat: lat, lon: lon)).retrive
    end
  end

  class Base
    extend ClassMethods
  end
end
