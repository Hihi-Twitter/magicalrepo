require_relative '../spec_helper'

describe User do
  it "has a secure password" do
    should have_secure_password
  end
end
