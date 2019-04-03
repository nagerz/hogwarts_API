class HogwartsService

  def house_students(house)
    house_data(house)
  end

  def house_data(house)
    get_json("house/#{house}")
  end

  def houses
    get_json("house")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://hogwarts-as-a-service.herokuapp.com/api/v1/') do |faraday|
      faraday.headers['x_api_key'] = ENV['key']
      faraday.adapter  Faraday.default_adapter
    end
  end
end
