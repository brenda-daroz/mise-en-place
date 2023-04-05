
require 'rails_helper'
RSpec.describe Recipe, driver: :selenium_chrome, js: true do
describe "the signin process", type: :feature do
  before :each do
    User.create(email: 'user@example.com', password: 'password')
  end

  it "signs me in" do
    visit '/users/sign_in'
    within(".form-box") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content "Signed in successfully."
  end
end
end
