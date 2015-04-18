require 'net/http'
require 'json'

module OpenWeather
  class Base

    attr_reader :url, :options, :weather_info, :status, :message

    def initialize(url, options)
      @status  = false
      @url     = url
      @options = extract_options!(options)
    end

    def retrive
      response = send_request unless @options.empty?
      parse_response(response)
    end

    def success?
      @status == 200
    end

    private

    def extract_options!(options)
      valid_options = [ :id, :lat, :lon, :cnt, :city, :lang, :units, :APPID,
        :country]

      options.keys.each { |k| options.delete(k) unless valid_options.include?(k) }

      if options[:city] || options[:country]
        options[:q] = "#{options[:country]},#{options[:city]}"
        options.delete(:city)
        options.delete(:country)
      end

      options
    end

    def parse_response(response)
      return if response.nil?
      @weather_info = JSON.parse(response)
      @status       = @weather_info['cod']
      @message      = @weather_info['message'] unless @status
      @weather_info
    end

    def send_request
      uri       = URI(@url)
      uri.query = URI.encode_www_form(options)
      Net::HTTP.get(uri)
    end
  end
end
