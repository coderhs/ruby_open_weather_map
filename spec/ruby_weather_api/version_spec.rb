require 'open_weather_api'

describe "Version" do
  it "should be version 0.0.1" do
    OpenWeather::VERSION.should == "0.0.1"
  end
end
