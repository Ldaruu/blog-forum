# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  eamil:"example@admin.com",
  password:"123456",
  password_confirmation:"123456",
  name:"BoB Admin",
  roles:"site_admin"
)
puts "Admin User Created"

User.create!(
  eamil:"example@example.com",
  password:"123456",
  password_confirmation:"123456",
  name:"BoB Guest",
)
puts "Guest User Created"

3.times do 
  topic = Topic.create!(
    title: Faker::ProgrammingLanguage.name
  )
end

puts "3 Topics was craeted"

10.times do 
  blog = Blog.create!(
    title: Faker::Game.title, 
    body: Faker::Hipster.paragraph,
    topic_id: Topic.last.id
  )
end

puts "10 blog post ceated"

5.times do 
  skill = Skill.create!(
    title: Faker::ProgrammingLanguage.name,
   precent_utilized: Faker::Number.within(range: 1..100),
  )
end

puts "5 skills created"

8.times do 
  portfolio_item = Portfolio.create!(
    title: Faker::Job.title,
    subtitle: Faker::Job.field,
    body:  Faker::Hipster.paragraph,
    main_image: Faker::Avatar.image(slug: "my-main-avatar#{portfolio_item}", size: "600x400"),
    thumb_image: Faker::Avatar.image(slug: "my-thumb-avatar#{portfolio_item}", size: "350x200"),
  )
end

1.times do 
  portfolio_item = Portfolio.create!(
    title: Faker::Job.title,
    subtitle: "React",
    body:  Faker::Hipster.paragraph,
    main_image: Faker::Avatar.image(slug: "my-main-avatar#{portfolio_item}", size: "600x400"),
    thumb_image: Faker::Avatar.image(slug: "my-thumb-avatar#{portfolio_item}", size: "350x200"),
  )
end

puts "9 portfolio created"

3.times do
  technology = Portfolio.last.technologies.create!(
    name: Faker::ProgrammingLanguage.name,
  )
end

puts "3 technologies created"