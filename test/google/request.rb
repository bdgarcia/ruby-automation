require "net/https"
require "uri"

describe 'GET request', type: :feature do
    context 'When the request tries to get a teapot' do
      it 'shows 418 teapot code' do
        uri = URI.parse("https://www.google.com/teapot")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        
        puts "Getting status code from GET request to https://www.google.com/teapot"
        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)

        puts "The status code is: #{response.code}"

        expect(response.code).to include("418")
      end
    end
end
