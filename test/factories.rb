# frozen_string_literal: true

# use by calling FactoryBot.create(:facebook_user)
# see https://devhints.io/factory_bot for further details
FactoryBot.define do
  factory :facebook_user, class: User do
    name { 'John' }
    last_name { 'Doe' }
    email { 'facebook@user.com' }
    password { 'facebookpassword' }
  end

  factory :google_user, class: User do
    name { 'John' }
    last_name { 'Doe' }
    email { 'google@user.com' }
    password { 'googlepassword' }
  end
end
