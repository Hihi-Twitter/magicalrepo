User.delete_all

user = User.new(handle: 'harriet', name: 'harriet', email: 'hsemckinnon@gmail.com', password: 'password', password_confirmation: 'password')
user.save
piet = User.new(handle: 'piet',name: 'piet', email: 'piet@gmail.com', password: 'password', password_confirmation: 'password')
piet.save

piet.tweets << Tweet.create(content: "This is Piet's tweet")
user.tweets << Tweet.create(content: "This is Harriet's tweet")

piet.followers << user
