# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  helper_method :current_user
  before_action :redirect_if_not_logged_in

  private

  def redirect_if_not_logged_in
    redirect_to(new_sessions_path) if current_user.nil?
  end

  def warden
    request.env['warden']
  end
end
