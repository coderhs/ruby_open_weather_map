require 'httparty'
require 'addressable/uri'
module OpenWeather
  class Base
    def self.send_request(request)
      uri = Addressable::URI.parse(request.url)
      uri.query_values = request.options
      HTTParty.get(uri.to_s)
    end
  end
end
