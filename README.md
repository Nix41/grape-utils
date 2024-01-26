# Grape::Utils

This gem offers some templates for basic CRUD endpoints using grape, grape-entity and grape-kaminari

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add grape-utils

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install grape-utils

## Basic Usage

Given you already have a Grape API set up, and a model `Foo`, with a `Entities:Foo`, you can Use `::Grape::Utils::Templates::Crud` as follows:

```ruby
module AwesomeAPI
  module Resources
    class Foo < Base

      resource :foos do
        mount ::Grape::Utils::Templates::Crud, with: {
          # The collection that will be used for the index endpoint
          index: Foo.all,
          # The ActiveModel instance that will be used to create, update and find_by!
          model: Foo,
          # The entity that will be used as a return type
          entity: Entities::Foo,
          # The required params for the Create endpoint
          required_params: [:name]
        }
      end
    end
  end
end
```

This will mount 5 endpoints in your API: Index, Show, Create, Update and Delete

Each of this templates can also be accessed individually if needed:

```ruby
module AwesomeAPI
  module Resources
    class Foo < Base

      resource :foos do
        mount Grape::Utils::Templates::Index, with: { model: Foo, index: Foo.all, entity: Entities::Foo }
        mount Grape::Utils::Templates::Show, with: { model: Foo, entity: Entities::Foo }
        mount Grape::Utils::Templates::Create, with: { model: Foo, entity: Entities::Foo}
        mount Grape::Utils::Templates::Update, with: { model: Foo.all, entity: Entities::Foo }
        mount Grape::Utils::Templates::Delete, with: { model: Foo, entity: Entities::Foo }

        route_param :id, type: Integer do
            get 'nested_foo' do
                #Any other relevant logic
            end
        end
      end
    end
  end
end
```

This way you can customize one of the methods to fit your situation while still using the rest as standard


## Entities and Params

The Entities Definition is used in 2 essential ways: first as a return type, and second as the param definition for the POST and PATCH endpoints

From the Entities exposed fields, only those with a `documentation` property will be used as a param on the POST/PATCH endpoints

So given:
```ruby
module AwesomeAPI
  module Entities
    class Foo < Grape::Entity
      expose :id
      expose :name, documentation: { type: String }
      expose :configuration, documentation: { type: JSON }
      expose :created_at
      expose :updated_at
    end
  end
end
```

Only `name` and `configuration` will be accepted as params in POST and PATCH endpoints, with it's corresponding types

### Required Params

You can define which of the documented exposed fields of the Entity are required for the creation of the resource
by mounting `::Grape::Utils::Templates::Crud` or `::Grape::Utils::Templates::Create` with `required_params: String[]`

### ID Column

By default, it is assumed that the resources will be identified by the column `id`
This will be used as the route parameter of the Show, Update and Delete endpoints, and by means of which, the resource will be located
If you want to change the name of the column to use as id, you can
mount the relevant templates `with{... column_id: 'field_key' }`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Nix41/grape-utils. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Nix41/grape-utils/blob/master/CODE_OF_CONDUCT.md).

Particularly I am still working on getting the gem 100% covered

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Grape::Utils project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/grape-utils/blob/master/CODE_OF_CONDUCT.md).
