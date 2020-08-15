# frozen_string_literal: true

module Web
  module Neighbour
    class PasswordsController < ApplicationController
      skip_before_action :redirect_if_not_logged_in

      def new; end

      def create; end
    end
  end
end
