require 'rails_helper'

#As a user
RSpec.describe 'As a user' do
  context 'when I search by house and go to a search page' do
    it 'I see a list of students wiht info' do
      #When I visit "/"
      visit '/'

      #And I select "Slytherin" from the dropdown
      select 'Slytheirn', :from => :house
      select 'Slytherin'

      #And I click on "Get Students"
      click_on 'Get Students'

      #Then my path should be "/search" with "house=slytherin" in the parameters
      expect(current_path).to eq('/search?house=slytherin')

      #And I should see a message "22 Students"
      expect(page).to have_content('Slytherin House:')
      expect(page).to have_content('22 Students')

      #And I should see a list of the 22 members of Slytherin
      expect(page).to have_css(".student", count: 22)

      #And I should see a name and id for each student.
      within(first(".member")) do
        expect(page).to have_css(".name")
        expect(page).to have_css(".id")
      end
    end
  end
end
