describe 'Open weather Current API' do
  context '.city' do
    it 'return current weather for cochi' do
      response = VCR.use_cassette("api/current_city_valid") do
        OpenWeather::Current.city('Cochin, In')
      end
      response['cod'].should eq(200)
    end

    it 'returns error if the city is invalid' do
      response = VCR.use_cassette("api/current_city_invalid") do
        OpenWeather::Current.city('Cochiiiiiin, In')
      end
      response['cod'].should eq("404")
    end
  end

  context '.city_id' do
    it 'return current weather for city id of cochi' do
      response = VCR.use_cassette("api/current_city_id_valid") do
        OpenWeather::Current.city_id('1273874')
      end
      response['cod'].should eq(200)
    end

    it 'returns error if the city id is invalid' do
      response = VCR.use_cassette("api/current_city_id_invalid") do
        OpenWeather::Current.city('invalidid')
      end
      response['cod'].should eq("404")
    end
  end

  context '.geocode' do
    it 'return current weather for geocode of cochi' do
      response = VCR.use_cassette("api/current_geocode_valid") do
        OpenWeather::Current.geocode('9.94', '76.26')
      end
      response['cod'].should eq(200)
    end

    it 'returns error if the geocode is invalid' do
      response = VCR.use_cassette("api/current_geocode_invalid") do
        OpenWeather::Current.geocode('181', '181')
      end
      response['cod'].should eq("404")
    end
  end

  context 'units option' do
    it 'returns the current temperature in requested units' do
      response = VCR.use_cassette("api/current_city_metric_valid") do
        OpenWeather::Current.city('Cochin, In', units: 'metric')
      end
      temp_metric = response['main']['temp']

      response = VCR.use_cassette("api/current_city_imperial_valid") do
        OpenWeather::Current.city('Cochin, In', units: 'imperial')
      end
      temp_imperial = response['main']['temp']
      farenheit_to_celsius = ((temp_imperial - 32) / 1.8000)

      expect(farenheit_to_celsius).to be_within(0.01).of(temp_metric)
    end
  end
end

describe 'Open weather Forecast API' do
  context '.city' do
    it 'return forecast weather for cochi' do
      response = VCR.use_cassette("api/forecast_city_valid") do
        OpenWeather::Forecast.city('Cochin, In')
      end
      response['cod'].to_s.should eq("200")
    end

    it 'returns error if the city is invalid' do
      response = VCR.use_cassette("api/forecast_invalid") do
        OpenWeather::Forecast.city('Cochiiiiiin, In')
      end
      response['cod'].to_s.should eq("404")
    end
  end

  context '.city_id' do
    it 'return forecast weather for city id of cochi' do
      response = VCR.use_cassette("api/forecast_city_id_valid") do
        OpenWeather::Forecast.city_id('1273874')
      end
      response['cod'].to_s.should eq("200")
    end

    it 'returns error if the city id is invalid' do
      response = VCR.use_cassette("api/forecast_city_id_invalid") do
        OpenWeather::Forecast.city('invalidid')
      end
      response['cod'].to_s.should eq("404")
    end
  end

  context '.geocode' do
    it 'return forecast weather for geocode of cochi' do
      response = VCR.use_cassette("api/forecast_geocode_valid") do
        OpenWeather::Forecast.geocode('9.94', '76.26')
      end
      response['cod'].to_s.should eq("200")
    end

    it 'returns error if the geocode is invalid' do
      response = VCR.use_cassette("api/forecast_geocode_invalid") do
        OpenWeather::Forecast.geocode('181', '181')
      end
      response['cod'].to_s.should eq("404")
    end
  end

  context 'units option' do
    it 'returns the forecast in requested units' do
      response = VCR.use_cassette("api/forecast_city_metric_valid") do
        OpenWeather::Forecast.city('Cochin, In', units: 'metric')
      end
      temp_metric = response['list'].first['main']['temp']

      response = VCR.use_cassette("api/forecast_city_imperial_valid") do
        OpenWeather::Forecast.city('Cochin, In', units: 'imperial')
      end
      temp_imperial = response['list'].first['main']['temp']
      farenheit_to_celsius = ((temp_imperial - 32) / 1.8000)

      expect(farenheit_to_celsius).to be_within(temp_metric-1).of(temp_metric+1)
    end
  end
  context 'cnt option' do
    it "returns the daily forecast in requested cnt" do
      response = VCR.use_cassette("api/forecast_city_cnt_valid") do
        OpenWeather::Forecast.city('Cochin, In', cnt: 10)
      end
      response['list'].size.should eq(10)

      response = VCR.use_cassette("api/forecast_city_id_cnt_valid") do
        OpenWeather::Forecast.city_id('1273874', cnt: 10)
      end
      response['list'].size.should eq(10)

      response = VCR.use_cassette("api/forecast_geocode_cnt_valid") do
        OpenWeather::Forecast.geocode('9.94', '76.26', cnt: 10)
      end
      response['list'].size.should eq(10)
    end
  end
end
