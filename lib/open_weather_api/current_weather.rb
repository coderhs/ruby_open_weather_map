module OpenWeather
  class Current < Base
    attr_reader :url, :options, :weather_info, :status, :message

    def initialize(options = {})
      @status = false
      @url = "http://api.openweathermap.org/data/2.5/weather"
      @options = extract_options!(options)
    end

    def retrive
      @response = Base.public_send(:send_request, self) unless @options.empty?
      parse_response if @response
    end

    def success?
      @status == 200
    end

    private

    def extract_options!(options)
      valid_options = [:lat, :lon, :city, :country, :city_id]
      options.keys.each { |k| options.delete(k) unless valid_options.include?(k) }
      if options[:city] || options[:country]
        options[:q] = "#{options[:country]},#{options[:city]}"
        options.delete(:city)
        options.delete(:country)
      end

      if options[:city_id]
        options[:id] = options[:city_id]
        options.delete(:city_id)
      end
      options
    end

    def parse_response
      @weather_info = @response.to_h
      @status = @weather_info["cod"]
      @message = @weather_info["message"] unless @status
      @weather_info
    end
  end
end



