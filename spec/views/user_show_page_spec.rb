require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create(name: 'Vana', password: 'Vseray47', bio: 'I am full-stack dev',
                           email: 'vanaseray@gmail.com', confirmed_at: Time.now)
      visit root_path
      fill_in 'Email', with: 'vanaseray@gmail.com'
      fill_in 'Password', with: 'Vseray47'
      click_button 'Log in'

      @post1 = Post.create(title: 'To Be',
                           text: 'The big question is: "To be or not to be a Ruby programmer"',
                           comments_counter: 0,
                           likes_counter: 0, user: @user1)
      @post2 = Post.create(title: 'Hello',
                           text: 'Why people say HTML is not a programming language..."',
                           comments_counter: 0,
                           likes_counter: 0, user: @user1)
      @post3 = Post.create(title: 'Hey',
                           text: 'With the clif hanger seen in the
                           first half of season 4, do you think..."',
                           comments_counter: 0,
                           likes_counter: 0,
                           user: @user1)

      visit user_path(@user1.id)
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows the username' do
      expect(page).to have_content('Vana')
    end

    it 'shows number of posts for each user' do
      user = User.first
      expect(page).to have_content(user.posts_counter)
    end

    it 'shows the users bio' do
      expect(page).to have_content('I am full-stack dev')
      visit user_session_path
    end

    it 'Should see the user\'s first 3 posts.' do
      expect(page).to have_content 'The big question is: "To be or not to be a Ruby programmer"'
      expect(page).to have_content 'Why people say HTML is not a programming language...'
      expect(page).to have_content 'With the clif hanger seen in the first half of season 4, do you think...'
    end

    it 'Can see a button that lets me view all of a users posts' do
      expect(page).to have_content('See all post')
    end

    it 'When I click to see all posts, it redirects me to the users posts index page.' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end
