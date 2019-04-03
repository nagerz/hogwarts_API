require 'rails_helper'

RSpec.describe HogwartsService do
  before :each do
    @house = 'Slytherin'
    @data = {
            "data": [
                {
                    "id": "4",
                    "type": "house",
                    "attributes": {
                        "name": "Slytherin",
                        "students": [
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
                            },
                            {
                                "id": 54,
                                "name": "Phineas Black",
                                "house_id": 4,
                                "created_at": "2019-03-30T17:47:41.209Z",
                                "updated_at": "2019-03-30T17:47:41.209Z"
                            },
                            {
                                "id": 55,
                                "name": "Leta Letsrange",
                                "house_id": 4,
                                "created_at": "2019-03-30T17:47:41.217Z",
                                "updated_at": "2019-03-30T17:47:41.217Z"
                            },
                            {
                                "id": 56,
                                "name": "Cassiopeia Black",
                                "house_id": 4,
                                "created_at": "2019-03-30T17:47:41.224Z",
                                "updated_at": "2019-03-30T17:47:41.224Z"
                            }
                          ]
                      }
                  }
              ]
          }

  end

  it 'exists' do
    service = HogwartsService.new
    expect(service).to be_a(HogwartsService)
  end

  context 'instance methods', :vcr do
    it '.house_students' do
      service = HogwartsService.new

      expect(service.house_students(@house).count).to eq(22)
      expect(service.house_students(@house).first[:id]).to eq(52)
    end
  end
end
