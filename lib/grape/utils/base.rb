# frozen_string_literal: true

module Grape
  module Utils
    class Base < ::Grape::API
      format :json
      content_type :json, "application/json"
    end
  end
end
