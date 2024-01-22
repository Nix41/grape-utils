# frozen_string_literal: true

module Grape
  module Utils
    module Helpers
      def permitted_params
        @permitted_params ||= declared(params, include_missing: false)
      end
    end
  end
end
