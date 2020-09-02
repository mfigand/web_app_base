# frozen_string_literal: true

module Web
  module Neighbour
    class UsersController < ApplicationController
      skip_before_action :redirect_if_not_logged_in, only: :create

      def create
        new_user.roles.new(name: 3)

        if new_user.save
          flash[:notice] = 'User created succesfully'
          redirect_to new_sessions_path
        else
          flash[:error] = new_user.errors.full_messages.to_sentence
          redirect_to new_user_path
        end
      end

      def show
        @user = User.find(params[:id])

        if policy(@user).show?
          render :show
        else
          redirect_to home_path, status: :unauthorized
        end
      end

      def edit
        @user = User.find(params[:id])

        if policy(@user).edit?
          render :edit
        else
          redirect_to home_path, status: :unauthorized
        end
      end

      def update
        @user = User.find(params[:id])

        if policy(@user).edit?
          if @user.update(user_params)
            flash[:notice] = 'User Successfully updated'
            redirect_to user_path(@user)
          else
            flash[:error] = "Can't update User: #{@user.errors.full_messages}"
            redirect_to edit_user_path(@user)
          end
        else
          redirect_to home_path, status: :unauthorized
        end
      end

      private

      def user_params
        params.permit(:name, :lastname, :email, :password)
      end

      def new_user
        @_new_user ||= User.new(user_params)
      end
    end
  end
end
