# frozen_string_literal: true

require "grape-kaminari"

module Grape
  module Utils
    module Templates
      # Adds a GET method to index all the scope of the resource
      class Index < ::Grape::API
        include ::Grape::Kaminari
        helpers Grape::Utils::Helpers

        mounted do
          desc "Lists all #{configuration[:model].name}"
          params do
            use :pagination, per_page: 10, max_per_page: 30
          end
          get do
            list = calculate_scope(scope: configuration[:scope], model: configuration[:model])

            present list, with: configuration[:entity]
          end
        end
      end
    end
  end
end
