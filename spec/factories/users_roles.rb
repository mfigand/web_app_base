# frozen_string_literal: true

FactoryBot.define do
  factory :users_role do
    user_id { create(:user).id }
    role_id { create(:role).id }
  end
end
