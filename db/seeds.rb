require 'faker'

User.delete_all
Tweet.delete_all

user = User.new(handle: 'harriet', name: 'harriet', email: 'hsemckinnon@gmail.com', password: 'password', password_confirmation: 'password')
user.save
piet = User.new(handle: 'piet',name: 'piet', email: 'piet@gmail.com', password: 'password', password_confirmation: 'password')
piet.save

piet.tweets << Tweet.create(content: "This is Piet's tweet")
sleep(1)
user.tweets << Tweet.create(content: "This is Harriet's tweet")

piet.followers << user

10.times do
  user = User.create(handle: Faker::Internet.user_name, name: Faker::Name.name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
  10.times do
    user.tweets << Tweet.create(content: Faker::Hacker.say_something_smart)
  end
end
