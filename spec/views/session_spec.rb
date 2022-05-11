require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do
    before(:each) do
      User.create! name: 'Vana', password: 'Vseray47', email: 'vanaseray@gmail.com', confirmed_at: Time.now
    end
    it 'shows the right content' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end

    it 'Fill email and password inputs' do
      visit new_user_session_path
      sleep(1)
      fill_in 'Email', with: 'Tekle@gmail.com'
      fill_in 'Password', with: '123456'
      sleep(1)
      click_button 'Log in'
      sleep(3)
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Without fill email and password inputs' do
      visit new_user_session_path
      sleep(1)
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      sleep(1)
      click_button 'Log in'
      sleep(3)
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Fill email and password inputs' do
      visit new_user_session_path
      sleep(1)
      fill_in 'Email', with: 'vanaseray@gmail.com'
      fill_in 'Password', with: 'Vseray47'
      sleep(1)
      click_button 'Log in'
      sleep(3)
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_current_path root_path
    end
  end
end
