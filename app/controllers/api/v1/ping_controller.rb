# frozen_string_literal: true

module Api
  module V1
    class PingController < ApplicationController
      skip_before_action :redirect_if_not_logged_in

      def ping
        render json: { data: 'pong' }, status: :ok
      end
    end
  end
end
