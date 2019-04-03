require 'rails_helper'

RSpec.describe HouseFacade do
  before :each do
    @house = 'Slytherin'
    @facade = HouseFacade.new(@house)
  end

  it 'exists' do
    expect(@facade).to be_a(HouseFacade)
  end

  describe 'Class Methods' do
    it '.house_name' do
      expect(@facade.house_name).to eq(@house)
    end

    it '.house_id' do
      expect(@facade.house_id).to eq(4)
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
      expect(@facade.students.first.name).to eq("Gormlaith Gaunt")
      expect(@facade.students.first.id).to eq(52)
    end

    it '.find_house_id' do
      house_data = {
                        "id": 1,
                        "name": "Gryffindor"
                    },
                    {
                        "id": 2,
                        "name": "Ravenclaw"
                    },
                    {
                        "id": 3,
                        "name": "Hufflepuff"
                    },
                    {
                        "id": 4,
                        "name": "Slytherin"
                    }

      expect(@facade.find_house_id(@house)).to eq(4)
    end
  end
end
