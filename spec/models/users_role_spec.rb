# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersRole, type: :model do
  let(:users_role) { create(:users_role) }

  describe 'validations' do
    it 'Create a valid users_role' do
      expect(users_role).to be_valid
    end

    it 'Invalid with same scope' do
      expect(build(:users_role, user_id: users_role.user_id, role_id: users_role.role_id)).not_to be_valid
    end
  end
end
