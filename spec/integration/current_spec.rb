describe "Current weather information with APPID" do
  let(:options) do
    { units: "metric", APPID: 1111111111 }
  end

  describe "searching by city" do
    context "when the city is found" do
      let(:weather) do
        VCR.use_cassette("integration/current_by_city") do
          OpenWeather::Current.city("Berlin, DE", options)
        end
      end

      it "returns results" do
        expect(weather).to include("weather")
      end
    end

    context "when the city is not found" do
      let(:weather) do
        VCR.use_cassette("integration/current_not_found_city") do
          OpenWeather::Current.city("Berlin, DE", options)
        end
      end

      it "returns an attribute with code 404" do
        expect(weather["cod"]).to eq("404")
      end
    end
  end

  describe "searching by geolocation" do
    let(:weather) do
      VCR.use_cassette("integration/current_by_geocode") do
        OpenWeather::Current.geocode(48.140938, 11.582005, options)
      end
    end

    it "returns results" do
      expect(weather).to include("weather")
    end
  end

  describe "searching by city_id" do
    let(:weather) do
      VCR.use_cassette("integration/current_by_city_id") do
        OpenWeather::Current.city_id(524901, options)
      end
    end

    it "returns results" do
      expect(weather).to include("weather")
    end
  end
end
