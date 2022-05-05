# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: "Ben", photo: "url", bio: "Hey my name is ben, I'm dev", posts_counter: 0)
user2 = User.create(name: "Sarine", photo: "url", bio: "Hey my name is Sarine", posts_counter: 0)
user3 = User.create(name: "Sam", photo: "url", bio: "Hey my name is Sam", posts_counter: 0)
user4 = User.create(name: "Dean", photo: "url", bio: "Hey my name is Dean", posts_counter: 0)

post1 = Post.create(user_id: 1, title: 'Cats and Dogs', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', comments_counter: 0, likes_counter: 0)

post2 = Post.create(user_id: 2, title: 'Cats and Dogs', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', comments_counter: 0, likes_counter: 0)

post3 = Post.create(user_id: 2, title: 'Cats and Dogs 2', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', comments_counter: 0, likes_counter: 0)

post4 = Post.create(user_id: 3, title: 'Cats and Dogs', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', comments_counter: 0, likes_counter: 0)

post5 = Post.create(user_id: 4, title: 'Cats and Dogs ', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', comments_counter: 0, likes_counter: 0)

post6 = Post.create(user_id: 5, title: 'Cats and Dogs', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', comments_counter: 0, likes_counter: 0)

post7 = Post.create(user_id: 6, title: 'Cats and Dogs 2', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', comments_counter: 0, likes_counter: 0)

comment1 = Comment.create(text: "great", user_id: user2, post:post1)
comment2 = Comment.create(text: "hello", user_id: user2, post:post2)

Like.create(user_id: 1, post: post1)

# user1.comments.create!(text: 'Wow', post: post1)
# user1.comments.create!(text: 'Well Done 👏👏👏', post: post1)
# user1.comments.create!(text: 'Love 💓 it!!!', post: post1)
# user2.comments.create!(text: 'Big like', post: post2)
# user2.comments.create!(text: 'Love 💓 it again!!!', post: post2)
# user2.comments.create!(text: 'Thank you all', post: post2)
# user3.comments.create!(text: 'Wow', post: post3)
# user3.comments.create!(text: 'Bon appetit', post: post3)
# user3.comments.create!(text: 'I want to eat', post: post3)
# user1.comments.create!(text: 'I like 💓 food!!!', post: post1)
# user3.comments.create!(text: 'Love 💓 it again!!!', post: post1)
# user1.comments.create!(text: 'Thank you all', post: post2)