
module OpenWeather
  module ClassMethods
    # City format : Eg, Cochin,IN
    # Usage: OpenWeather::Current.city('Cochin,In')
    def city(city, options = {})
      new(options.merge(city: city)).retrieve
    end

    # City Id, an integer value. Eg, 2172797
    # Usage: OpenWeather::Current.city_id(2172797)
    def city_id(id, options = {})
      new(options.merge(id: id)).retrieve
    end

    # City Geographics Cordingates : Eg, lat 35 lon 139
    def geocode(lat, lon, options = {})
      new(options.merge(lat: lat, lon: lon)).retrieve
    end
  end

  module SeveralCitiesClassMethods
    # City Ids, an array of integer values. Eg, [2172797, 524901]
    # Usage: OpenWeather::Current.cities([2172797, 524901])
    def cities(ids, options = {})
      url = 'http://api.openweathermap.org/data/2.5/group'
      ids = ids.join ',' # get comma-separated list, as required by the API
      new(options.merge(id: ids)).retrieve url
    end
  end

  class Base
    extend ClassMethods
  end

  class Current
    extend SeveralCitiesClassMethods
  end
end
