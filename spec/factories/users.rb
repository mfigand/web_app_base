# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end
end

FactoryBot.define do
  factory :user do
    name { 'Name' }
    lastname { 'Lastname' }
    email { generate :email }
    password_digest { '12345678' }
  end
end

# FactoryBot.define do
#   factory :user do
#     name { "MyString" }
#     lastname { "MyString" }
#     email { "MyString" }
#     password_digest { "MyString" }
#     deleted_at { "2020-07-12 21:27:33" }
#   end
# end