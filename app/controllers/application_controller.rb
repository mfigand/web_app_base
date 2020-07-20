# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :redirect_if_not_logged_in

  private

  def redirect_if_not_logged_in
    if current_user.nil?
      redirect_to(new_sessions_path)
    end
  end

  def warden
    request.env['warden']
  end
end

