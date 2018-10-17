require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      name: 'First User',
      email: 'first@user.com',
      password: '12345678',
      password_confirmation: '12345678'
    )
  end
  scenario "users can login successfully and are taken to the home page once they are signed in" do
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'first@user.com'
      fill_in id: 'password', with: '12345678'

      click_button 'Submit'

      sleep 3
      save_screenshot
    end
    
  end
  
end
