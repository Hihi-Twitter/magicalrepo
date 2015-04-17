
require_relative '../spec_helper'


 
describe 'Profile' do
  describe '#update' do
    it 'returns the sum of its arguments' do
      expect(User.update(handle: 'petejd', name: 'peterDun', email: 'pete@psc.net.nz', password: 'secure', password_confirmation: 'secure' )).to eq(5)
    end
  end
end

describe "POST /profile" do

it "can update name field" do
should validate_presence_of(:name)
end


it "can update email" do
should validate_presence_of(:email)
end

it "can update email" do
should validate_presence_of(:email)
end



end




# RSpec.describe Calculator do
#   describe '#add' do
#     it 'returns the sum of its arguments' do
#       expect(Calculator.new.add(1, 2)).to eq(3)
#     end
#   end
# end


	####################################	

# describe "POST /update" do

# it "can update fields" do
# should have...
# end
# end

# describe User do
# it "has can update fields" do
# should have...
# end
# end

# describe "controller" do
# describe "GET/user_profile"
# it returns an http: stag

# #validate attributes
# #validate new user creatio
# #Render properties
#



