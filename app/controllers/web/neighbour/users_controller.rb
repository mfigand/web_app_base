# frozen_string_literal: true

module Web
  module Neighbour
    class UsersController < ApplicationController
      skip_before_action :redirect_if_not_logged_in

      def create
        user.roles.new(name: 3)

        if user.save
          flash[:notice] = 'Usuario creado con éxtio'
          redirect_to new_sessions_path
        else
          flash[:error] = user.errors.full_messages.to_sentence
          redirect_to new_users_path
        end
      end

      private

      def user
        @_user ||= User.new(user_params)
      end

      def user_params
        params.permit(:name, :lastname, :email, :password)
      end
    end
  end
end
