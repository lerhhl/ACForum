# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

#Clear database
Comment.delete_all
Topic.delete_all
User.delete_all


#Users
user_1 = User.create(firstname: 'James', lastname: 'Bond', is_admin: false, email: 'james_bond@example.com', password: 'password', password_confirmation: 'password')
user_2 = User.create(firstname: 'Demo', lastname: 'Demo', is_admin: true, email: 'demo@demo.com', password: 'password', password_confirmation: 'password')
user_3 = User.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, is_admin: false, email: 'demo2@demo.com', password: 'password', password_confirmation: 'password')


#Topics
topic_1 = Topic.create(title: 'Are cats beautiful?', body: 'Cats stuffs', user_id: user_1.id, votes: Faker::Number.between(0, 5), status: Faker::Number.between(1, 3) )
topic_2 = Topic.create(title: 'Are dogs beautiful?', body: 'Dogs stuffs', user_id: user_1.id, votes: Faker::Number.between(0, 5), status: Faker::Number.between(1, 3) )
topic_3 = Topic.create(title: Faker::Book.title, body: Faker::Book.author, user_id: user_2.id, votes: Faker::Number.between(0, 5), status: Faker::Number.between(1, 3) )
topic_4 = Topic.create(title: Faker::HarryPotter.character, body: Faker::HarryPotter.location, user_id: user_3.id, votes: Faker::Number.between(0, 5), status: Faker::Number.between(1, 3) )
topic_5 = Topic.create(title: Faker::HarryPotter.character, body: Faker::HarryPotter.location, user_id: user_1.id, votes: Faker::Number.between(0, 5), status: Faker::Number.between(1, 3) )
topic_6 = Topic.create(title: Faker::HarryPotter.character, body: Faker::HarryPotter.location, user_id: user_1.id, votes: Faker::Number.between(0, 5), status: Faker::Number.between(1, 3) )
topic_7 = Topic.create(title: Faker::HarryPotter.character, body: Faker::HarryPotter.location, user_id: user_1.id, votes: Faker::Number.between(0, 5), status: Faker::Number.between(1, 3) )
topic_8 = Topic.create(title: Faker::HarryPotter.character, body: Faker::HarryPotter.location, user_id: user_1.id, votes: Faker::Number.between(0, 5), status: Faker::Number.between(1, 3) )
topic_9 = Topic.create(title: Faker::HarryPotter.character, body: Faker::HarryPotter.location, user_id: user_1.id, votes: Faker::Number.between(0, 5), status: Faker::Number.between(1, 3) )
topic_10 = Topic.create(title: Faker::HarryPotter.character, body: Faker::HarryPotter.location, user_id: user_1.id, votes: Faker::Number.between(0, 5), status: Faker::Number.between(1, 3) )
topic_11 = Topic.create(title: Faker::HarryPotter.character, body: Faker::HarryPotter.location, user_id: user_1.id, votes: Faker::Number.between(0, 5), status: Faker::Number.between(1, 3) )
#Topic.first.update_attributes(:updated_at => 1.year.ago)


#Comments
comment_1 = Comment.create(content: 'I like cats', topic_id: topic_1.id, user_id: user_1.id, votes: 5)
comment_2 = Comment.create(content: 'Cats are cool', topic_id: topic_1.id, user_id: user_1.id, votes: 5)
comment_3 = Comment.create(content: 'I like dogs', topic_id: topic_2.id, user_id: user_1.id, votes: 3)
comment_4 = Comment.create(content: 'Dogs are cool', topic_id: topic_2.id, user_id: user_1.id, votes: 2)
comment_5 = Comment.create(content: Faker::Book.genre, topic_id: topic_3.id, user_id: topic_3.user.id, votes: Faker::Number.between(0, 5))
comment_6 = Comment.create(content: Faker::Book.genre, topic_id: topic_3.id, user_id: topic_3.user.id, votes: Faker::Number.between(0, 5))
comment_7 = Comment.create(content: Faker::Book.genre, topic_id: topic_3.id, user_id: topic_3.user.id, votes: Faker::Number.between(0, 5))
comment_8 = Comment.create(content: Faker::Book.genre, topic_id: topic_3.id, user_id: topic_3.user.id, votes: Faker::Number.between(0, 5))
comment_9 = Comment.create(content: Faker::HarryPotter.quote, topic_id: topic_4.id, user_id: topic_4.user.id, votes: Faker::Number.between(0, 5))
comment_10 = Comment.create(content: Faker::HarryPotter.quote, topic_id: topic_4.id, user_id: topic_4.user.id, votes: Faker::Number.between(0, 5))
comment_11 = Comment.create(content: Faker::HarryPotter.quote, topic_id: topic_4.id, user_id: topic_4.user.id, votes: Faker::Number.between(0, 5))
comment_12 = Comment.create(content: Faker::HarryPotter.quote, topic_id: topic_4.id, user_id: topic_4.user.id, votes: Faker::Number.between(0, 5))
comment_13 = Comment.create(content: Faker::HarryPotter.quote, topic_id: topic_4.id, user_id: topic_4.user.id, votes: Faker::Number.between(0, 5))
comment_14 = Comment.create(content: Faker::HarryPotter.quote, topic_id: topic_4.id, user_id: topic_4.user.id, votes: Faker::Number.between(0, 5))
comment_15 = Comment.create(content: Faker::HarryPotter.quote, topic_id: topic_4.id, user_id: topic_4.user.id, votes: Faker::Number.between(0, 5))
comment_16 = Comment.create(content: Faker::HarryPotter.quote, topic_id: topic_4.id, user_id: topic_4.user.id, votes: Faker::Number.between(0, 5))
comment_17 = Comment.create(content: Faker::HarryPotter.quote, topic_id: topic_4.id, user_id: topic_4.user.id, votes: Faker::Number.between(0, 5))
comment_18 = Comment.create(content: Faker::HarryPotter.quote, topic_id: topic_4.id, user_id: topic_4.user.id, votes: Faker::Number.between(0, 5))
comment_19 = Comment.create(content: Faker::HarryPotter.quote, topic_id: topic_4.id, user_id: topic_4.user.id, votes: Faker::Number.between(0, 5))
comment_20 = Comment.create(content: Faker::HarryPotter.quote, topic_id: topic_4.id, user_id: topic_4.user.id, votes: Faker::Number.between(0, 5))
comment_21 = Comment.create(content: Faker::HarryPotter.quote, topic_id: topic_4.id, user_id: topic_4.user.id, votes: Faker::Number.between(0, 5))
#Topic.first.comments.first.update_attributes(:updated_at => 1.year.ago)

#Tags
