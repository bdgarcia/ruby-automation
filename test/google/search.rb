# frozen_string_literal: true

require './test/spec_helper.rb'

describe 'Search', type: :feature do
  describe 'Search google' do
    context 'When the user googles google' do
      it 'shows google in the results' do
        home_page = PageObjects::Home.new
        visit 'http://www.google.com'
        home_page.searchbox.set('google')
        home_page.searchbutton.click
        expect(page.find('#search a[href="https://www.google.com/"]'))
          .to be_truthy
      end
    end
  end
end
