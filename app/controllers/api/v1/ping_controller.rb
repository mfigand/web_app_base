# frozen_string_literal: true

module Api
  module V1
    class PingController < ApplicationController
      def ping
        render json: { data: 'pong' }, status: :ok
      end
    end
  end
end
