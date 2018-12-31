# frozen_string_literal: true

require 'rspec'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara/dsl'
require 'selenium/webdriver'
require 'yaml'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/inflector'
require 'dotenv'
require 'faker'
require 'pry'
require 'site_prism'
require 'rspec/repeat'
require 'factory_bot'

# Requires supporting ruby files with custom helper methods in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. It is recommended that you do not name files to
# end with _spec.rb.
Dir['./test/google/pageobjects/*.rb'].each { |f| require f }

# Load env variables from .env
Dotenv.overload '.env'

profile = Selenium::WebDriver::Chrome::Profile.new
profile['download.prompt_for_download'] = false

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.app_host = 'http://www.google.com' # change url
end

Capybara.register_driver :headless_chrome do |app|
  Capybara.javascript_driver = :headless_chrome

  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args:
                           %w[headless disable-gpu] }
  )
  Capybara::Selenium::Driver.new(app,
                                 browser: :chrome,
                                 desired_capabilities: capabilities,
                                 profile: profile)
end

# Local browser
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app,
                                 browser: ENV['BROWSER_NAME'].to_sym,
                                 args: ['--window-size=1920,1080'],
                                 profile: profile)
end

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers

  config.alias_it_should_behave_like_to :it_has_behavior, 'has behavior:'

  config.include RSpec::Repeat
  config.around :each, type: :feature do |example|
    repeat example, 3.times, clear_let: false, verbose: true
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = %I[should expect]
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  config.filter_run_excluding exclude: true
  config.include FactoryBot::Syntax::Methods
  FactoryBot.find_definitions
end
