# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::Neighbour::PasswordsController, type: :controller do
  let(:neighbour) { create(:user) }

  before(:example) do
    neighbour.roles.create(name: 'neighbour')
    stub_warden(request, neighbour)
  end

  describe 'Update Password' do
    it '#update user password succesfully' do
      put :update, params: { old_password: 'Abc.1234',
                             new_password: '1234.Asdf',
                             new_password_confirmation: '1234.Asdf' }
      expect(response.status).to eq(302)
      expect(flash[:notice]).to  eq('Password successfully updated')
    end

    it '#update user password fail by wrong password' do
      put :update, params: { old_password: 'wrong_password',
                             new_password: '1234.Asdf',
                             new_password_confirmation: '1234.Asdf' }
      expect(response.status).to eq(302)
      expect(flash[:error]).to eq("Can't update password: wrong password")
    end
  end
end
