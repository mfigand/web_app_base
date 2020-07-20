# frozen_string_literal: true

module Web
  module Neighbour
    class SessionsController < ApplicationController
      skip_before_action :redirect_if_not_logged_in

      def create
        if authenticate          
          redirect_to '/'
        else
          flash[:error] = 'Incorrect Email or Password'
          redirect_to new_sessions_path
        end
        
      end

      def destroy
        logout
        redirect_to new_sessions_path
      end

      private

      def user
        @_user ||= User.find_by(email: user_params[:email])
      end

      def user_params
        params.permit(:email, :password)
      end
    end
  end
end