# frozen_string_literal: true

module Grape
  module Utils
    module Templates
      # Adds a PATCH method to update an instance of the resource
      class Update < ::Grape::API
        helpers Grape::Utils::Helpers

        mounted do
          route_param :id, type: String do
            desc "Updates a #{configuration[:model].name}"
            params do
              requires :none, using: configuration[:entity].documentation
            end
            patch do
              scope = configuration[:scope] || configuration[:model]
              resource = scope.find_by!((configuration[:column_id] || :id) => params[:id])
              resource.update!(permitted_params.except(:id))

              present resource, with: configuration[:entity]
            end
          end
        end
      end
    end
  end
end
