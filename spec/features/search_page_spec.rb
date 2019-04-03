require 'rails_helper'

#As a user
RSpec.describe 'As a user' do
  context 'when I search by house and go to a search page' do
    it 'I see a list of students wiht info' do
      #When I visit "/"
      visit '/'

      #And I select "Slytherin" from the dropdown
      select 'Slytherin', :from => :house

      #And I click on "Get Students"
      click_on 'Get Students'

      #Then my path should be "/search" with "house=slytherin" in the parameters
      expect(current_path).to eq(search_path)
      expect(current_url).to include('house=Slytherin')

      #And I should see a message "22 Students"
      expect(page).to have_content('Slytherin House:')
      expect(page).to have_content('22 Students')

      #And I should see a list of the 22 members of Slytherin
      expect(page).to have_css(".student", count: 22)

      #And I should see a name and id for each student.
      within(first(".student")) do
        expect(page).to have_content("Gormlaith Gaunt")
        expect(page).to have_content("52")
      end
    end
  end
end
