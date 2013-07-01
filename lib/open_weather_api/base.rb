require 'httparty'
require 'addressable/uri'
module OpenWeather
  class Base
    def self.send_request hash, url
      uri = Addressable::URI.parse(url)
      uri.query_values = hash
      HTTParty.get(uri.to_s)
    end
  end
end