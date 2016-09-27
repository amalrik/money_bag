require 'rails_helper'

describe "the signup process", :type => :feature do

  it "allows user to signup" do
    visit 'users/sign_up'
    within("#new_user") do
      fill_in 'Name', :with => 'user'
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password123'
      fill_in 'Password confirmation', :with => 'password123'
    end
    click_button 'Sign up'
    expect(page).to have_content 'user created successfuly'
  end
end