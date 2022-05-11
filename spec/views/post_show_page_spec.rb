require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create(name: 'Vana', password: 'Vseray47', bio: 'I am full-stack dev',
                           email: 'vanaseraydarian123@gmail.com', confirmed_at: Time.now)
      @user2 = User.create(name: 'Steve', password: '12345', bio: 'My name is Steve',
                           email: 'steve@gmail.com', confirmed_at: Time.now)
      visit root_path
      fill_in 'Email', with: 'vanaseraydarian123@gmail.com'
      fill_in 'Password', with: 'Vseray47'
      click_button 'Log in'

      @post1 = Post.create(title: 'To Be',
                           text: 'The big question is: "To be or not to be a Ruby programmer"',
                           comments_counter: 0,
                           likes_counter: 0,
                           user: @user1)
      @post2 = Post.create(title: 'Hello',
                           text: 'Why people say HTML is not a programming language..."',
                           comments_counter: 0,
                           likes_counter: 0,
                           user: @user1)
      @post3 = Post.create(title: 'Hey',
                           text: 'With the clif hanger seen in the
                           first half of season 4, do you think..."',
                           comments_counter: 0,
                           likes_counter: 0,
                           user: @user1)

      @comment1 = Comment.create(text: 'This is the first comment for the first post', user: User.first,
                                 post: Post.first)
      @comment2 = Comment.create(text: 'This is the second comment', user: User.first, post: Post.first)
      @comment3 = Comment.create(text: 'This is the third comment', user: User.first, post: Post.first)

      visit user_post_path(@user1, @post1)
    end

    it 'shows posts title' do
      expect(page).to have_content('To Be')
    end

    it 'shows the person who wrote the post' do
      expect(page).to have_content('Vana')
    end

    it 'shows number of comments' do
      post = Post.first
      expect(page).to have_content(post.comments_counter)
    end

    it 'shows number of likes' do
      post = Post.first
      expect(page).to have_content(post.likes_counter)
    end

    it 'can see the post\'s body.' do
      expect(page).to have_content('This is the first comment for the first post')
    end

    it 'can see the username of each commentor.' do
      post = Post.first
      comment = post.comments.first
      expect(page).to have_content(comment.user.name)
    end

    it 'can see the comments of each commentor.' do
      expect(page).to have_content 'This is the second comment'
    end
  end
end
