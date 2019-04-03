require 'rails_helper'

RSpec.describe HogwartsService do
  before :each do
    @house = 'Slytherin'
    @house_id = 4
  end

  it 'exists' do
    service = HogwartsService.new
    expect(service).to be_a(HogwartsService)
  end

  context 'instance methods', :vcr do
    it '.house_students' do
      service = HogwartsService.new

      expect(service.house_students(@house_id).count).to eq(22)
      expect(service.house_students(@house_id).first[:id]).to eq(52)
    end

    it '.houses' do
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

      service = HogwartsService.new

      expect(service.houses).to eq(house_data)
    end
  end
end
