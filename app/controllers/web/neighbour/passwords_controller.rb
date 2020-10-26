# frozen_string_literal: true

module Web
  module Neighbour
    class PasswordsController < ApplicationController
      skip_before_action :redirect_if_not_logged_in

      def new; end

      def create; end

      def update
        # rubocop:disable Layout/LineLength
        change_password = ::Web::Neighbour::ChangePassword.new(user: current_user,
                                                               old_password: params[:old_password],
                                                               new_password: params[:new_password],
                                                               new_password_confirmation: params[:new_password_confirmation]).call!
        # rubocop:enable Layout/LineLength

        if change_password.success?
          flash[:notice] = 'Password successfully updated'
        else
          flash[:error] = "Can't update password: #{change_password.data[:message]}"
        end
        redirect_to user_path(current_user)
      end
    end
  end
end
