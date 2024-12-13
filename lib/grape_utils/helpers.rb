# frozen_string_literal: true

module Grape
  module Utils
    module Helpers
      def permitted_params
        @permitted_params ||= declared(params, include_missing: false)
      end

      def calculate_scope(scope:, model:)
        initial_scope = scope.is_a?(Proc) ? instance_eval(&scope) : scope
        initial_scope || model.all
      end
    end
  end
end
