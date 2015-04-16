require_relative '../spec_helper'

describe User do
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
end
