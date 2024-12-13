# frozen_string_literal: true

require "record_class"

RSpec.describe Grape::Utils::Templates::Create, type: :request do
  subject { Class.new(Grape::API) }

  def app
    subject
  end

  describe "test api" do
    context "mounting an API" do
      let(:params) { { name: "Foo" } }

      before do
        subject.version "v1", using: :path
        subject.format :json
        subject.content_type :json, "application/json"

        subject.namespace :cool do
          mount Grape::Utils::Templates::Create, with: {
            model: RecordClass.new,
            entity: MyEntity,
            required_params: %i[name]
          }
        end
      end

      it "mounts a post endpoint" do
        response = post "/v1/cool/", params
        expect(response.body).to eq([params].to_json)
      end
    end
  end
end
