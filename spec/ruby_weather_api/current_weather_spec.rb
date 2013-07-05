require "spec_helper"

describe "Current Weather Info" do
  context "Blank request" do
    before { @api = OpenWeather::Current.new }

    it "has the version 2.5 api url" do
      @api.url.should eq("http://api.openweathermap.org/data/2.5/weather")
    end

    it "wont't send request if the options are empty" do
      @api.retrive.should be_nil
    end
  end

  context "Request with proper options" do
    before { @api = OpenWeather::Current.new(city: "Kochi", country: "India") }

    it "retirves the weather info" do
      @api.retrive
      @api.success?.should be_true
    end
  end

  context "Request with wrong options" do
    before { @api = OpenWeather::Current.new(city: "Kochiiiiii", country: "India") }

    it "retirves the weather info" do
      @api.retrive
      @api.success?.should be_false
    end
  end
end
