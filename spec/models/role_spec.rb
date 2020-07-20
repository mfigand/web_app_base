# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { build(:role) }

  describe 'validations' do
    it 'Create a valid role' do
      expect(create(:role)).to be_valid
    end

    it 'Invalid without name' do
      expect(build(:role, name: nil)).not_to be_valid
    end

    it 'Valid without resource' do
      expect(build(:role, resource: nil)).to be_valid
    end

    it 'Valid without resource_id' do
      expect(build(:role, resource_id: nil)).to be_valid
    end
  end
end
