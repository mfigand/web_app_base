# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'validations' do
    it 'Create a valid user' do
      user = User.new(name: 'Name',
                      lastname: 'Lastname',
                      email: 'email@example.com')
      user.password = 'Abc.1234'
      user.password_confirmation = 'Abc.1234'

      expect(user).to be_valid
      expect(user.save).to be(true)
    end

    it 'should be invalid without email' do
      expect(build(:user, email: nil)).not_to be_valid
    end

    it 'should be invalid without password' do
      expect(build(:user, password: nil)).not_to be_valid
    end

    it 'should be invalid with invalid password' do
      user = User.new(name: 'Name',
                      lastname: 'Lastname',
                      email: 'email@example.com')
      user.password = '12345678'
      user.password_confirmation = '12345678'

      expect(user.save).to be(false)
      expect(user.errors.count).to be(1)
      expect(user.errors.include?(:password)).to be(true)
      expect(user.errors[:password]).to eq([User::PASSWORD_REQUIREMENTS_MSG])
    end

    it 'Return true if user has superadmin role' do
      user.roles.new(name: 1)
      user.save!
      expect(user.superadmin?).to be(true)
    end

    it 'Return true if user has admin role' do
      user.roles.new(name: 2)
      user.save!
      expect(user.admin?).to be(true)
    end

    it 'Return true if user has neighbour role' do
      user.roles.new(name: 3)
      user.save!
      expect(user.neighbour?).to be(true)
    end

    it 'should soft delete user' do
      expect(user.deleted_at.present?).to be(false)
      
      user.soft_delete
      expect(user.deleted_at.present?).to be(true)
    end
  end
end
