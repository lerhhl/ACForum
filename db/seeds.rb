# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

#Clear database
Comment.delete_all
Topic.delete_all
User.delete_all


#Users Create Admin
firstname = "Demo"
lastname = "Demo"
email = "demo@demo.com"
avatar = Faker::Avatar.image

User.create(firstname: firstname, lastname: lastname, is_admin: false, email: email, password: 'password', password_confirmation: 'password', remote_avatar_url: avatar)

# User
# Create 50 users
50.times do
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  email = Faker::Internet.email
  #avatar = Faker::Avatar.image
  avatar = ""

  User.create(firstname: firstname, lastname: lastname, is_admin: false, email: email, password: 'password', password_confirmation: 'password', remote_avatar_url: avatar)
end

# Topic
# Create 100 topics
100.times do
  title = Faker::HarryPotter.quote
  body = Faker::HarryPotter.quote + Faker::HarryPotter.quote + Faker::HarryPotter.quote + Faker::HarryPotter.quote
  votes = Faker::Number.between(-999, 999)
  status = Faker::Number.between(1, 3)
  user_id = User.order('RANDOM()').first.id

  Topic.create(title: title, body: body, user_id: user_id, votes: votes, status: status)
end

# Comment
# Create 200 Comments

200.times do 
  content = Faker::HarryPotter.quote + Faker::HarryPotter.quote
  topic_id = Topic.order('RANDOM()').first.id
  user_id = User.order('RANDOM()').first.id
  votes = Faker::Number.between(-999 , 999)
  status = Faker::Number.between(1, 3)

  Comment.create(content: content, topic_id: topic_id, user_id: user_id, votes: votes, status: status)
end



