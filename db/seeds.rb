# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

User.delete_all
Topic.delete_all

#Users
user_1 = User.create(firstname: 'James', lastname: 'Bond', is_admin: true, email: 'james_bond@example.com', password: 'password', password_confirmation: 'password')
user_2 = User.create(firstname: 'Demo', lastname: 'Demo', is_admin: true, email: 'demo@demo.com', password: 'password', password_confirmation: 'password')

#Topics
topic_1 = Topic.create(title: 'Are cats beautiful?', body: 'Cats stuffs', user_id: user_1.id, votes: 5, status: 1)
topic_2 = Topic.create(title: 'Are dogs beautiful?', body: 'Dogs stuffs', user_id: user_1.id, votes: 3, status: 2)

#Comments
comment_1 = Comment.create(content: 'I like cats', topic_id: topic_1.id, user_id: user_1.id, votes: 5)
comment_2 = Comment.create(content: 'Cats are cool', topic_id: topic_1.id, user_id: user_1.id, votes: 5)
comment_3 = Comment.create(content: 'I like dogs', topic_id: topic_2.id, user_id: user_1.id, votes: 3)
comment_4 = Comment.create(content: 'Dogs are cool', topic_id: topic_2.id, user_id: user_1.id, votes: 2)

#Tags