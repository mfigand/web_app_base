# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::Neighbour::UsersController, type: :controller do
  let(:neighbour) { create(:user) }
  let(:unauthorized_user) { create(:user) }

  before(:example) do
    neighbour.roles.create(name: 'neighbour')
    stub_warden(request, neighbour)
  end

  describe '#create' do
    it 'creates user succesfully' do
      get :create, params: { name: 'name',
                             lastname: 'lastname',
                             email: 'email@example.com',
                             password: 'Abc.1234' }

      expect(flash[:notice]).to eq('User created succesfully')
      expect(response).to redirect_to new_sessions_path
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
      expect(response).to redirect_to new_user_path
    end
  end

  describe '#show' do
    it 'show user succesfully' do
      get :show, params: { id: neighbour.id }

      expect(response.status).to be(200)
    end

    it 'fails to show by unauthorize' do
      get :show, params: { id: unauthorized_user.id }

      expect(response.status).to be(401)
    end
  end

  describe '#edit' do
    it 'edit user succesfully' do
      get :edit, params: { id: neighbour.id }

      expect(response.status).to be(200)
    end

    it 'fails to edit by unauthorize' do
      get :edit, params: { id: unauthorized_user.id }

      expect(response.status).to be(401)
    end
  end

  describe '#update' do
    let(:new_name) { 'foo' }

    it 'update user succesfully' do
      put :update, params: { id: neighbour.id,
                             name: new_name }

      expect(flash[:notice]).to be('User Successfully updated')
      expect(neighbour.reload.name).to eq(new_name)
    end

    it 'fails #update by incorrect password format' do
      get :update, params: { id: neighbour.id,
                             password: '1234' }

      neighbour.update(password: '1234')
      expect(flash[:error]).to eq("Can't update User: #{neighbour.errors.full_messages}")
      expect(response).to redirect_to(edit_user_path(neighbour))
    end

    it 'fails #update by unauthorize' do
      get :update, params: { id: unauthorized_user.id }

      expect(response.status).to be(401)
    end
  end
end
