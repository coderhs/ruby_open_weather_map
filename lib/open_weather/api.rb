
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
      ids = encode_array ids
      new(options.merge(id: ids)).retrieve url
    end

    # Bounding box (lat and lon of top left and bottom right points, map zoom)
    # Usage: OpenWeather::Current.rectangle_zone(12, 32, 15, 37, 10)
    def rectangle_zone(top_left_lat, top_left_lon,
                       bottom_right_lat, bottom_right_lon,
                       map_zoom, options = {})
      url = 'http://api.openweathermap.org/data/2.5/box/city'
      bbox = encode_array [top_left_lat, top_left_lon, bottom_right_lat,
              bottom_right_lon, map_zoom]
      new(options.merge(bbox: bbox)).retrieve url
    end

    # Circle zone (lat, lon and count of cities to return)
    # Usage: OpenWeather::Current.circle_zone(55.5, 37.5, 10)
    def circle_zone(lat, lon, count, options = {})
      url = 'http://api.openweathermap.org/data/2.5/find'
      new(options.merge(lat: lat, lon: lon, cnt: count)).retrieve url
    end

    private
    # Encodes an array in the format expected by the API (comma-separated list)
    def encode_array(arr)
      arr.join ','
    end
  end

  class Base
    extend ClassMethods
  end

  class Current
    extend SeveralCitiesClassMethods
  end
end
