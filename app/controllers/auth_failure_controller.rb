# frozen_string_literal: true

# rubocop:disable Rails/ApplicationController
class AuthFailureController < ActionController::Base
  def admin
    redirect_to(new_sessions_path)
  end

  def neighbour    
    redirect_to(new_sessions_path)
  end
end
# rubocop:enable Rails/ApplicationController