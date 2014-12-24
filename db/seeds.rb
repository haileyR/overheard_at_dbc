require 'faker'
10.times{
  User.create(name: Faker::Name.name, password: "a", password_confirmation: "a", email: Faker::Internet.email)
}

User.all.each do |user|
  5.times {user.posts.create(who: Faker::Name.first_name, quote: Faker::Lorem.paragraph)}
end

Post.all.each do |post|
  rand(3..7).times {post.comments.create(content: Faker::Lorem.paragraph, user_id: rand(1..9))}
end