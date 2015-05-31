require 'net/http'
require 'json'

module OpenWeather
  class Base

    attr_reader :url, :options, :weather_info, :status, :message

    def initialize(url, options)
      @status       = false
      @url          = url
      @options      = extract_options!(options)
      @weather_info = { 'cod': nil, 'message': '' }
    end

    def retrive
      response = send_request unless @options.empty?

      if ![200, 404].include?(response.code.to_i)
        @weather_info['cod']      = response.code.to_i
        @weather_info['message']  = response.message

        @weather_info
      else
        parse_response(response.body)
      end

      @status   = @weather_info['cod']
      @message  = @weather_info['message']

      @weather_info
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

      begin
        @weather_info = JSON.parse(response)
      rescue JSON::ParserError
        @weather_info['cod']      = 500
        @weather_info['message']  = 'JSON parse error'
      end

      @weather_info
    end

    def send_request
      uri       = URI(@url)
      uri.query = URI.encode_www_form(options)
      Net::HTTP.get_response(uri)
    end
  end
end
