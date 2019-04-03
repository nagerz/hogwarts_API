class HouseFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def students
    student_data = service.house_students(@house)
    student_data.map do |data|
      Student.new(data)
    end
  end

  def service
    HogwartsService.new
  end

end
