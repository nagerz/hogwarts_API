class HouseFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def students
    service.house_students(@house)
  end

  def service
    HogwartsService.new
  end

end
