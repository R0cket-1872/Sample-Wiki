require "rails_helper"

feature "User signs up/logs in" do
  background do
  @user = FactoryGirl.build(:user)
  end
  scenario "Guest Signs up" do
    visit "/signup"
    fill_in "Username", :with => @user.username
    fill_in "Firstname", :with => @user.firstname
    fill_in "Lastname", :with => @user.lastname
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    fill_in "Confirmation", :with => @user.password
    click_button "Create my account"

    expect(page).to have_content("Signed Up! You can now login.")
  end
  scenario "User Logins" do
  user2 = FactoryGirl.create(:user)
  visit "/login"
  fill_in "Username", :with => user2.username
  fill_in "Password", :with => user2.password
  click_button "Log In"
  
  expect(page).to have_content("Logged in")
  end
  
end
