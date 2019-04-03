require 'rails_helper'

RSpec.describe HouseFacade do
  before :each do
    @house = 'Slytherin'
    @facade = HouseFacade.new(@house)
  end

  it 'exists' do
    expect(@facade).to be_a(HouseFacade)
  end

  describe 'Clas Methods' do
    it '.house' do
      expect(@facade.house).to eq(@house)
    end

    it '.students' do
      students = [
                    {
                        "id": 52,
                        "name": "Gormlaith Gaunt",
                        "house_id": 4,
                        "created_at": "2019-03-30T17:47:41.195Z",
                        "updated_at": "2019-03-30T17:47:41.195Z"
                    },
                    {
                        "id": 53,
                        "name": "Corvinus Gaunt",
                        "house_id": 4,
                        "created_at": "2019-03-30T17:47:41.202Z",
                        "updated_at": "2019-03-30T17:47:41.202Z"
                    }
                  ]

      expect(@facade.students.count).to eq(22)
      expect(@facade.students.first).to eq(students[0])
    end
  end
end
