User.delete_all
user = User.new(handle:'hazza', name: 'harriet', email: 'hsemckinnon@gmail.com', password: 'password', password_confirmation: 'password')
user.save

user1 = User.new(handle:'hacker', name: 'happy', email: 'happy@gmail.com', password: 'password', password_confirmation: 'password')
user1.save
