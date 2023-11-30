# frozen_string_literal: true

module Grape
  module Utils
    module Templates
      # Adds POST method to create a new instance of the resource
      class Create < ::Grape::API
        helpers Grape::Utils::Helpers

        mounted do
          desc "Creates an instance of #{configuration[:model].class_name}"
          params do
            requires :none, except: configuration[:required_params],
                            using: configuration[:entity].documentation
          end
          post do
            resource = configuration[:model].create!(permitted_params)

            present resource, with: configuration[:entity]
          end
        end
      end
    end
  end
end
