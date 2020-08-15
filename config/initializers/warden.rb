# frozen_string_literal: true

require "#{Rails.configuration.root}/lib/warden/strategies/admin/form.rb"
require "#{Rails.configuration.root}/lib/warden/strategies/neighbour/form.rb"

Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.failure_app = ->(env) { AuthFailureController.action(env['warden.options'][:action]).call(env) }

  manager.scope_defaults :admin, strategies: [:admin_form], action: :web
  manager.scope_defaults :neighbour, strategies: [:neighbour_form], action: :web

  manager.serialize_from_session(:admin) do |id|
    User.find_by(id: id)
  end
  manager.serialize_into_session(:admin, &:id)

  manager.serialize_from_session(:neighbour) do |id|
    User.find_by(id: id)
  end
  manager.serialize_into_session(:neighbour, &:id)
end

Warden::Strategies.add(:admin_form, Warden::Strategies::Admin::Form)
Warden::Strategies.add(:neighbour_form, Warden::Strategies::Neighbour::Form)
