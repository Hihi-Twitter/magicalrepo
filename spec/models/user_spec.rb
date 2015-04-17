require_relative '../spec_helper'

describe User do

  before(:all) do
    @current_user = User.create(handle: 'piet', name: 'piet', email:"pietgeursen@gmail.com", password: "secure", password_confirmation: "secure")
    @user_to_follow = User.create(handle: 'sreynak', name: 'sreynak', email:"sreynak@gmail.com", password: "secure", password_confirmation: "secure")
    @user_tweet = Tweet.create(content: "user's tweet")
    @followees_tweet = Tweet.create(content: "followee's tweet")

    @current_user.tweets << @user_tweet
    @user_to_follow.tweets << @followees_tweet

    @user_to_follow.followers << @current_user
    @current_user.followers << @user_to_follow
  end

  it "has a secure password" do
    should have_secure_password
  end
  it "has a unique email address" do
    should validate_uniqueness_of(:email)
  end
  it "has a unique handle" do
    should validate_uniqueness_of(:handle)
  end
  it "has a name" do
    should validate_presence_of(:name)
  end
  it "has a email" do
    should validate_presence_of(:email)
  end
  it "has a handle" do
    should validate_presence_of(:handle)
  end
  it "has a name column" do
    should have_db_column(:name)
  end

  it "has followers" do

    expect(@current_user.followers).to include(@user_to_follow)

  end

  it "has followees" do
    expect(@current_user.followees).to include(@user_to_follow)
  end

  it "has tweets" do
    expect(@current_user.tweets).to include(@user_tweet)
  end

  it "has followees tweets" do
    expect(@current_user.followees.first.tweets).to include(@user_to_follow.tweets.first)
  end

  after(:all) do
    Tweet.delete_all
    User.delete_all
  end
end
