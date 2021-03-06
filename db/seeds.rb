# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Clear database
Comment.delete_all
Topic.delete_all
User.delete_all


# Users - Create Admin
firstname = "Admin"
lastname = "Admin"
email = "admin@admin.com"
avatar = Faker::Avatar.image

User.create(firstname: firstname, lastname: lastname, is_admin: true,
            email: email, password: 'password',
            password_confirmation: 'password',
            remote_avatar_url: avatar)

# Users - Create Demo

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
10.times do
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
80.times do
  title = Faker::HarryPotter.quote
  body = Faker::HarryPotter.quote + Faker::HarryPotter.quote +
         Faker::HarryPotter.quote + Faker::HarryPotter.quote +
         Faker::HarryPotter.quote + Faker::HarryPotter.quote
  votes = Faker::Number.between(-999, 999)
  status = Faker::Number.between(1, 2)
  offset = rand(User.count)
  user_id = User.offset(offset).limit(1).first.id
  view_counts = Faker::Number.between(0, 999)
  comments_count = 0
  
  Topic.create(title: title, body: body, user_id: user_id, votes: votes,
               comments_count: comments_count, status: status, view_counts: view_counts)
end

# Comment
# Create 200 Comments

400.times do 
  content = Faker::HarryPotter.quote + Faker::HarryPotter.quote
  offset = rand(Topic.count)
  topic_id = Topic.offset(offset).limit(1).first.id
  offset = rand(User.count)
  user_id = User.offset(offset).limit(1).first.id
  votes = Faker::Number.between(-999 , 999)
  status = Faker::Number.between(1, 2)

  Comment.create(content: content, topic_id: topic_id, user_id: user_id,
                 votes: votes, status: status)
end

Topic.all.each do |topic|
  topic.comments_count = topic.comments.where(status: 2).count
  topic.save
end

Topic.all.each do |topic|
  topic.comments.each do |comment|
    if topic.comment_date == nil || topic.comment_date < comment.updated_at
      topic.comment_date = comment.updated_at
      topic.save
    end
  end  
end

#Create tags

50.times do
  tagname = Faker::Color.color_name
  if !Tag.exists?(:name => tagname)
    Tag.create(:name => tagname)
  end
end

#Assign tags to topics

300.times do

  offset = rand(Topic.count)
  chosen_topic = Topic.offset(offset).limit(1).first

  offset = rand(Tag.count)
  chosen_tag = Tag.offset(offset).limit(1).first

  if chosen_topic.tags.exists?(:id => chosen_tag.id)
    
  else
    TopicTag.create(:tag_id => chosen_tag.id , :topic_id => chosen_topic.id)
  end
  
end



