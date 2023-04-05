require 'rails_helper'
require 'capybara/rspec'
RSpec.describe Recipe, driver: :selenium_chrome, js: true do
describe 'show index page' do
    it 'should have the website name' do
      visit root_path

      expect(page).to have_content 'mise en place'
    end
  end

  describe 'show index page' do
    it 'should have a search button' do
      visit root_path

      expect(page).to have_css('.searchbutton')
    end
  end

  describe 'click com recipe link' do
    it 'should click on recipe and navigate to details page' do
      visit root_path

      click_link("Korean Honey Citron Tea Cheesecake")
      expect(current).to eql("/recipes/264")

    end
  end
end
