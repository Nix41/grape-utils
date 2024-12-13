# frozen_string_literal: true

module Grape
  module Utils
    module Templates
      # Adds a GET method to show details of an instance eof the resource
      class Show < ::Grape::API
        helpers Grape::Utils::Helpers

        mounted do
          route_param :id, type: String do
            desc "Details of a #{configuration[:model].name}"
            get do
              scope = calculate_scope(scope: configuration[:scope], model: configuration[:model])
              resource = scope.find_by!((configuration[:column_id] || :id) => params[:id])
              present resource, with: configuration[:entity]
            end
          end
        end
      end
    end
  end
end
