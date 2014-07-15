require 'spec_helper'

# success response
#
# {"coord"=>{"lon"=>76.26, "lat"=>9.94},
#  "sys"=>
#   {"message"=>0.1938,
#    "country"=>"India",
#    "sunrise"=>1390007802,
#    "sunset"=>1390049651},
#  "weather"=>
#   [{"id"=>800, "main"=>"Clear", "description"=>"Sky is Clear", "icon"=>"01d"}],
#  "base"=>"gdps stations",
#  "main"=>
#   {"temp"=>303.534,
#    "temp_min"=>303.534,
#    "temp_max"=>303.534,
#    "pressure"=>1022.72,
#    "sea_level"=>1026.59,
#    "grnd_level"=>1022.72,
#    "humidity"=>72},
#  "wind"=>{"speed"=>1.21, "deg"=>143.5},
#  "clouds"=>{"all"=>0},
#  "dt"=>1390029526,
#  "id"=>1273874,
#  "name"=>"Kochi",
#  "cod"=>200
# }

# failure response
#
# {"message"=>"Error: Not found city", "cod"=>"404"}

describe 'Open weather Current API' do
  context '.city' do
    it 'return current weather for cochi' do
      response = OpenWeather::Current.city('Cochin, In')
      response['cod'].should eq(200)
    end

    it 'returns error if the city is invalid' do
      response = OpenWeather::Current.city('Cochiiiiiin, In')
      response['cod'].should eq("404")
    end
  end

  context '.city_id' do
    it 'return current weather for city id of cochi' do
      response = OpenWeather::Current.city_id('1273874')
      response['cod'].should eq(200)
    end

    it 'returns error if the city id is invalid' do
      response = OpenWeather::Current.city('invalidid')
      response['cod'].should eq("404")
    end
  end

  context '.geocode' do
    it 'return current weather for geocode of cochi' do
      response = OpenWeather::Current.geocode('9.94', '76.26')
      response['cod'].should eq(200)
    end

    it 'returns error if the geocode is invalid' do
      response = OpenWeather::Current.geocode('181', '181')
      response['cod'].should eq("404")
    end
  end

  context 'units option' do
    it 'returns the current temperature in requested units' do
      response = OpenWeather::Current.city('Cochin, In', units: 'metric')
      temp_metric = response['main']['temp']

      response = OpenWeather::Current.city('Cochin, In', units: 'imperial')
      temp_imperial = response['main']['temp']
      farenheit_to_celsius = ((temp_imperial - 32) / 1.8000)

      expect(farenheit_to_celsius).to be_within(0.01).of(temp_metric)
    end
  end
end

describe 'Open weather Forecast API' do
  context '.city' do
    it 'return forecast weather for cochi' do
      response = OpenWeather::Forecast.city('Cochin, In')
      response['cod'].to_s.should eq("200")
    end

    it 'returns error if the city is invalid' do
      response = OpenWeather::Forecast.city('Cochiiiiiin, In')
      response['cod'].to_s.should eq("404")
    end
  end

  context '.city_id' do
    it 'return forecast weather for city id of cochi' do
      response = OpenWeather::Forecast.city_id('1273874')
      response['cod'].to_s.should eq("200")
    end

    it 'returns error if the city id is invalid' do
      response = OpenWeather::Forecast.city('invalidid')
      response['cod'].to_s.should eq("404")
    end
  end

  context '.geocode' do
    it 'return forecast weather for geocode of cochi' do
      response = OpenWeather::Forecast.geocode('9.94', '76.26')
      response['cod'].to_s.should eq("200")
    end

    it 'returns error if the geocode is invalid' do
      response = OpenWeather::Forecast.geocode('181', '181')
      response['cod'].to_s.should eq("404")
    end
  end

  context 'units option' do
    it 'returns the forecast in requested units' do
      response = OpenWeather::Forecast.city('Cochin, In', units: 'metric')
      temp_metric = response['list'].first['main']['temp']

      response = OpenWeather::Forecast.city('Cochin, In', units: 'imperial')
      temp_imperial = response['list'].first['main']['temp']
      farenheit_to_celsius = ((temp_imperial - 32) / 1.8000)

      expect(farenheit_to_celsius).to be_within(0.01).of(temp_metric)
    end
  end
end
