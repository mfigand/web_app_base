# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    mail = "user#{n}@example.com"
    while User.find_by(email: mail)
      n += 1
      mail = "user#{n}@example.com"
    end
    mail
  end
end

FactoryBot.define do
  factory :user do
    name { 'Name' }
    lastname { 'Lastname' }
    email { generate :email }
    password_digest { BCrypt::Password.create('Abc.1234') }
  end
end
