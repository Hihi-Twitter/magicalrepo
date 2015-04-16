require_relative '../spec_helper'

describe "follow controller" do

  describe "POST /follow" do

    before(:all) do
      User.delete_all
      @current_user = User.create(handle: 'piet', name: 'piet', email:"pietgeursen@gmail.com", password: "secure", password_confirmation: "secure")
      @user_to_follow = User.create(handle: 'sreynak', name: 'sreynak', email:"sreynak@gmail.com", password: "secure", password_confirmation: "secure")
      post '/signin', params = {email:@current_user.email, password:"secure" }
     end

    describe "follows another user" do
      before(:all) do
        post '/follow', {user_to_follow: @user_to_follow.id}
      end

      it "Returns status 302" do
        expect(last_response.status).to eq(302)
      end

      it "User to follow gains follower" do
        expect(@user_to_follow.followers).to include(@current_user)
      end

    end
  end
end
