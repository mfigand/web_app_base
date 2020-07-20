# frozen_string_literal: true

module Web
  module Neighbour
    class UsersController < ApplicationController
      before_action :authenticate_user, except: [:new, :create]

      def new
      end

      def create
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