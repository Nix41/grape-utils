# frozen_string_literal: true

module Grape
  module Utils
    module Templates
      # Adds a GET method to show details of an instance eof the resource
      class Show < Base
        mounted do
          route_param :id, type: String do
            desc "Details of a #{configuration[:model].class_name}"
            get do
              resource = configuration[:model].find_by!((configuration[:column_id] || :id) => params[:id])
              present resource, with: configuration[:entity]
            end
          end
        end
      end
    end
  end
end
