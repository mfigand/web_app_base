# frozen_string_literal: true

module Warden
  module Strategies
    module Neighbour
      class Form < Base
        def authenticate
          neighbour = ::User.where('LOWER(email) = ?', params['email'].downcase).take

          if neighbour&.authenticate(params['password'])
            success!(neighbour)
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
