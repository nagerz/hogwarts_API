class HogwartsService

  def house_students(house)
    house_data(house).first[:attributes][:students]
  end

  def house_data(house)
    get_json("house/#{house}")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def conn
  Faraday.new(:url => 'http://hogwarts-it.herokuapp.com/api/v1') do |faraday|
    faraday.params['api_key'] = ENV['key']
    faraday.adapter  Faraday.default_adapter
  end


  end
end
