# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Clear database
Comment.delete_all
Topic.delete_all
User.delete_all


# Users - Create Admin
firstname = "Demo"
lastname = "Demo"
email = "demo@demo.com"
avatar = Faker::Avatar.image

User.create(firstname: firstname, lastname: lastname, is_admin: false,
            email: email, password: 'password',
            password_confirmation: 'password',
            remote_avatar_url: avatar)

# User
# Create 50 users
30.times do
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  email = Faker::Internet.email
  avatar = Faker::Avatar.image
  #avatar = ""

  User.create(firstname: firstname, lastname: lastname, is_admin: false,
              email: email, password: 'password',
              password_confirmation: 'password',
              remote_avatar_url: avatar)
end

# Topic
# Create 100 topics
30.times do
  title = Faker::HarryPotter.quote
  body = Faker::HarryPotter.quote + Faker::HarryPotter.quote +
         Faker::HarryPotter.quote + Faker::HarryPotter.quote +
         Faker::HarryPotter.quote + Faker::HarryPotter.quote
  votes = Faker::Number.between(-999, 999)
  status = Faker::Number.between(1, 3)
  offset = rand(User.count)
  user_id = User.offset(offset).limit(1).first.id
  comments_count = 0
  
  Topic.create(title: title, body: body, user_id: user_id, votes: votes,
               comments_count: comments_count, status: status)
end

# Comment
# Create 200 Comments

500.times do 
  content = Faker::HarryPotter.quote + Faker::HarryPotter.quote
  offset = rand(Topic.count)
  topic_id = Topic.offset(offset).limit(1).first.id
  offset = rand(User.count)
  user_id = User.offset(offset).limit(1).first.id
  votes = Faker::Number.between(-999 , 999)
  status = Faker::Number.between(1, 3)

  Comment.create(content: content, topic_id: topic_id, user_id: user_id,
                 votes: votes, status: status)
end

Topic.all.each do |topic|
  topic.comments_count = topic.comments.count
  topic.save
end


