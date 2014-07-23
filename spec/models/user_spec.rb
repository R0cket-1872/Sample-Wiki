require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
	expect(FactoryGirl.build(:user)).to be_valid
end
  it "is invalid without a username" do
  user = FactoryGirl.build(:user, username: nil)
	expect(user).to have(1).errors_on(:username)
  end
  
  it "is invalid without a first and last name" do
  user = FactoryGirl.build(:user, firstname: nil, lastname: nil)
	expect(user).to have(1).errors_on(:firstname)
	expect(user).to have(1).errors_on(:lastname)
  end
  
  
  it "is invalid with a duplicate username" do
  user = FactoryGirl.create(:user, username: "Bob")
  bad_user = FactoryGirl.build(:user, username: "Bob")
  expect(bad_user).to have(1).errors_on(:username)
  end
  
  it "is invalid with a duplicate email" do
  user = FactoryGirl.create(:user)
  bad_user = FactoryGirl.build(:user, email: user.email)
  expect(bad_user).to have(1).errors_on(:email)
  end
  
  it "is invalid with a bad email" do
  user = FactoryGirl.build(:user, email: "rawrgmail.com")
  expect(user).to have(1).errors_on(:email)
  end
  
  
  end
  
