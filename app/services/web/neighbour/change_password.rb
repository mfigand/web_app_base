# frozen_string_literal: true

module Web
  module Neighbour
    class ChangePassword < Micro::Case
      attributes :user, :old_password, :new_password, :new_password_confirmation

      def call!
        return Failure result: { message: 'wrong password' } unless user.authenticate(old_password)

        if new_password != new_password_confirmation
          return Failure result: { message: 'new_password and new_password_confirmation does not match' }
        end

        save_user
      end

      private

      def save_user
        user.password = new_password
        user.password_confirmation = new_password_confirmation

        if user.save
          Success result: { user: user }
        else
          Failure result: { message: user.errors.full_messages.to_sentence }
        end
      end
    end
  end
end
