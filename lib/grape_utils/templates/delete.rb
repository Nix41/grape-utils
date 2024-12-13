# frozen_string_literal: true

module Grape
  module Utils
    module Templates
      # Adds DELETE method to delete an instance of the resource
      class Delete < ::Grape::API
        helpers Grape::Utils::Helpers

        mounted do
          route_param :id, type: String do
            desc "Deletes an instances of #{configuration[:model].name}"
            delete do
              scope = calculate_scope(scope: configuration[:scope], model: configuration[:model])
              resource = scope.find_by!((configuration[:column_id] || :id) => params[:id])
              resource.destroy!

              status(204)
            end
          end
        end
      end
    end
  end
end
