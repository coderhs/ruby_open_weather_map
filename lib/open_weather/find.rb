module OpenWeather
  class Find < Base
    def initialize(options = {})
      super('http://api.openweathermap.org/data/2.5/find', options)
    end

    def self.like(q, options = {})
      new(options.merge(q: q, type: 'like')).retrieve
    end

    def self.accurate(q, options = {})
      new(options.merge(q: q, type: 'accurate')).retrieve
    end
  end
end
