# frozen_string_literal: true

module Grape
  module Utils
    module Templates
      # Adds all requests necessary to CRUD the resource
      class Crud < ::Grape::API
        mounted do
          mount Templates::Index, with: { index: configuration[:index], entity: configuration[:entity] }

          mount Templates::Create, with: { model: configuration[:model],
                                           entity: configuration[:entity],
                                           required_params: configuration[:required_params] }

          mount Templates::Show, with: { model: configuration[:model],
                                         entity: configuration[:entity],
                                         column_id: configuration[:column_id] }

          mount Templates::Update, with: { model: configuration[:model],
                                           entity: configuration[:entity],
                                           column_id: configuration[:column_id] }

          mount Templates::Delete, with: { model: configuration[:model],
                                           entity: configuration[:entity],
                                           column_id: configuration[:column_id] }
        end
      end
    end
  end
end
