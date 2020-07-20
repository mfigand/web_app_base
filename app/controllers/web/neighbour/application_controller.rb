# frozen_string_literal: true

module Web
  module Neighbour
    class ApplicationController < ::ApplicationController
      helper_method :current_user

      private

      def authenticate
        warden.authenticate(scope: :neighbour)
      end

      def authenticate!
        warden.authenticate!(scope: :neighbour)
      end

      def authenticated?
        warden.authenticated?(scope: :neighbour)
      end

      def current_user
        warden.user(scope: :neighbour)
      end

      def logout
        warden.logout(:neighbour)
      end
    end
  end
end
