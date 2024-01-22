# frozen_string_literal: true

module Grape
  module Utils
    module Templates
      # Adds a GET method to index all the scope of the resource
      class Index < ::Grape::API
        include Grape::Kaminari
        helpers Grape::Utils::Helpers

        mounted do
          desc "Lists all #{configuration[:model].class_name}"
          params do
            use :pagination, per_page: 10, max_per_page: 30
          end
          get do
            list = configuration[:index]

            present paginate(list), with: configuration[:entity]
          end
        end
      end
    end
  end
end
