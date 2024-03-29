# frozen_string_literal: true

class RecordClass
  def name
    "RecordClass"
  end

  def create!(*args)
    args
  end
end

class MyEntity < Grape::Entity
  expose :name, documentation: { type: String }
end
