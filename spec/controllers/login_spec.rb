require_relative '../spec_helper'

describe "login controller" do

  describe "POST /signin" do

    before(:all) do
      @valid_user = User.create(name: 'Piet Geursen', handle: '@pietgeursen', email:"pietgeursen@gmail.com", password: "secure", password_confirmation: "secure")
    end

    describe "Login a user with a correct request" do
      before(:all) do
        post '/signin', params = {email:@valid_user.email, password:"secure" }
      end

      it "Returns status 302" do
        expect(last_response.status).to eq(302)
      end

    end

    describe "Doesn't login in a user with a bad request" do
      before(:all) do
        post '/signin', params = {email:@valid_user.email, password:"wrong" }
      end

      it "Returns status 302" do
        expect(last_response.status).to eq(302)
      end

    end

    after(:all) do
      User.delete_all
    end
  end

  describe "POST /signup" do

    before(:all) do
      @valid_user = User.create(name: 'Piet Geursen', handle: '@pietgeursen', email:"pietgeursen@gmail.com", password: "secure", password_confirmation: "secure")
    end

    describe "Signs up a user with a correct request" do

      before(:all) do
        post '/signup', params = {email:@valid_user.email, password: "secure", password_confirmation: "secure"}
      end

      it "Returns status 302" do
        expect(last_response.status).to eq(302)
      end

      it "Adds user to database" do
        expect(User.find_by_email(@valid_user.email).email).to include(@valid_user.email)
      end

      after(:all) do
        User.delete_all
      end
    end

    describe "Doesn't sign up a user with a bad request" do

      before(:all) do
        post '/signup', params = {email:@valid_user.email, new_password: "bad", new_password_confirmation: "secure"}
      end

      it "Returns status 302" do
        expect(last_response.status).to eq(302)
      end

      it "Doesn't add user to database" do
        expect(User.all.length).to eq(0)
      end

      after(:all) do
        User.delete_all
      end
    end

    after(:all) do
      User.delete_all
    end
  end

  describe "GET /signout" do
    before(:all) do
      post '/signout'
    end

    describe "Logs the user out" do
      before do
        @valid_user = User.create(email:"pietgeursen@gmail.com", password: "secure", password_confirmation: "secure")
        post '/signin', params = {email:@valid_user.email, password:"secure" }
        post '/signout'
      end

      it "Returns status 302 " do
        expect(last_response.status).to eq(302)
      end

    end
  end

end
