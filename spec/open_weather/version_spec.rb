require 'spec_helper'

describe "Version" do
  it "should be version 0.9.1" do
    OpenWeather::VERSION.should == "0.9.1"
  end
end
