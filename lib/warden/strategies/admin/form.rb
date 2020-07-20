# frozen_string_literal: true

module Warden
  module Strategies
    module Admin
      class Form < Base
        def authenticate
          admin = ::User.where('LOWER(email) = ?', params['email'].downcase).take

          if admin&.authenticate(params['password'])
            success!(admin)
          else
            # rubocop:disable Style/SignalException
            fail
            # rubocop:enable Style/SignalException
          end
        end

        def authenticate!
          authenticate || fail!
        end

        def valid?
          params['email'] && params['password']
        end
      end
    end
  end
end
