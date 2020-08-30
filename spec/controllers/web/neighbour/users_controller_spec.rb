# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::Neighbour::UsersController, type: :controller do
  # let(:neighbour) { create(:user) }

  # before(:example) do
  #   neighbour.roles.create(name: 'neighbour')
  #   stub_warden(request, neighbour)
  # end

  describe '#create' do
    it 'creates user succesfully' do
      get :create, params: { name: 'name',
                             lastname: 'lastname',
                              email: 'email@example.com',
                              password: 'Abc.1234' }
            
      expect(flash[:notice]).to eq('Usuario creado con éxtio')
      expect(response.status).to redirect_to new_sessions_path
    end

    it 'fails to create user' do
      user = User.new(name: 'Name',
                      lastname: 'Lastname',
                      email: 'email@example.com')
      user.password = '12345678'
      user.password_confirmation = '12345678'
      user.valid?

      get :create, params: { name: user.name,
                             lastname: user.lastname,
                              email: user.email,
                              password: user.password }
            
      expect(flash[:error]).to eq(user.errors.full_messages.to_sentence)
      expect(response.status).to redirect_to new_users_path
    end
  end
end
