require 'rails_helper'
RSpec.describe Recipe, driver: :selenium_chrome, js: true do
describe 'show index page' do
    it 'should have the website name' do
      visit recipes_path

      expect(page).to have_content 'mise en place'
    end
  end

  describe 'show index page' do
    it 'should have a search button' do
      visit recipes_path

      expect(page).to have_css('.searchbutton')
    end
  end
end
