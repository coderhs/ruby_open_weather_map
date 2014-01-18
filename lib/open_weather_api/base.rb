require 'httparty'
require 'addressable/uri'

module OpenWeather
  class Base

    attr_reader :url, :options, :weather_info, :status, :message

    def initialize url, options
      @status = false
      @url = url
      @options = extract_options!(options)
    end

    def retrive
      @response = send_request(self) unless @options.empty?
      parse_response if @response
    end

    def success?
      @status == 200
    end

    private

    def extract_options!(options)
      valid_options = [:lat, :lon, :city, :country, :id]
      options.keys.each { |k| options.delete(k) unless valid_options.include?(k) }

      if options[:city] || options[:country]
        options[:q] = "#{options[:country]},#{options[:city]}"
        options.delete(:city)
        options.delete(:country)
      end

      options
    end

    def parse_response
      @weather_info = @response
      @status = @weather_info["cod"]
      @message = @weather_info["message"] unless @status
      @weather_info
    end

    def send_request(request)
      uri = Addressable::URI.parse(request.url)
      uri.query_values = request.options
      HTTParty.get(uri.to_s)
    end
  end
end
