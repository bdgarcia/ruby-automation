require './tests/spec_helper.rb'

describe 'Search', typr: :feature do

  describe 'Search google' do
    context 'When the user googles google' do
      it 'shows google in the results' do
        home_page = PageObjects::Home.new
        visit 'http://www.google.com'
        home_page.searchbox.set('google')
        home_page.searchbutton.click 
      end
    end
  end
end