class HouseFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def students
    conn = Faraday.new(:url => 'http://hogwarts-it.herokuapp.com/api/v1') do |faraday|
      faraday.params['api_key'] = ENV['key']
      faraday.adapter  Faraday.default_adapter
    end

    response = conn.get("house/#{@house}")

    JSON.parse(response.body, symbolize_names: true)[:data].first[:attributes][:students]
  end

end
