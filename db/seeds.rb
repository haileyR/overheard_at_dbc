require 'faker'
10.times{
  User.create(name: Faker::Name.name, password: "a", password_confirmation: "a", email: Faker::Internet.email)
}

User.all.each do |user|
  5.times {user.posts.create(title: Faker::Name.title, content: Faker::Lorem.paragraph)}
end