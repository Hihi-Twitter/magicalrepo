User.delete_all

user = User.new(handle: 'harriet', name: 'harriet', email: 'hsemckinnon@gmail.com', password: 'password', password_confirmation: 'password')
user.save
piet = User.new(handle: 'piet',name: 'piet', email: 'piet@gmail.com', password: 'password', password_confirmation: 'password')
piet.save
