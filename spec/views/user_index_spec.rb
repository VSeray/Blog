require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'Vana', password: 'Vseray47', email: 'vanaseraydarian123@gmail.com', confirmed_at: Time.now
      @user2 = User.create! name: 'Tekle', password: '123456', email: 'tekle@gmail.com', confirmed_at: Time.now
      visit root_path
      fill_in 'Email', with: 'vanaseraydarian123@gmail.com'
      fill_in 'Password', with: 'Vseray47'
      click_button 'Log in'
      visit root_path
    end

    it 'shows the username of other users' do
      expect(page).to have_content('Vana')
      expect(page).to have_content('Tekle')
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(2)
    end

    it 'shows number of posts for each user' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'show users page when clicked' do
      expect(page).to have_content('Number of posts: 0')
      click_on 'Vana'
      expect(page).to have_current_path user_path(@user1)
      expect(page).to have_no_content('Tekle')
    end
  end
end
