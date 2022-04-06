require 'rails_helper'

RSpec.describe 'Register Page' do
  describe 'has a form to fill out with name, email, password, and
  password confirmation that creates a new user' do
    it 'has a form with inputs that redirects to the created
    users show page' do
      visit root_path
      click_on 'Create a New User'
      expect(current_path).to eq(register_path)

      fill_in 'Name', with: 'Logan'
      fill_in 'Email', with: 'l@gmail.com'
      fill_in 'password', with: 'password'
      fill_in 'password confirmation', with: 'password'
      click_on 'Register'
      logan = User.find_by(name:'Logan')
      expect(current_path).to eq(user_path(logan))
    end
  end
end
