class HouseFacade
  attr_reader :house_name, :house_id

  def initialize(house)
    @house_name = house
    @house_id = find_house_id(house)
  end

  def students
    student_data = service.house_students(@house_id)
    student_data.map do |data|
      Student.new(data)
    end
  end

  def service
    HogwartsService.new
  end

  def find_house_id(house)
    house_data = service.houses
    selected_house = house_data.select { |house| house[:name] == @house_name }
    selected_house.first[:id]
  end

end
