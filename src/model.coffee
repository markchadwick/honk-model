_ = require 'lodash'


class Model
  @Field = require './fields'

  @field: (name, type) ->
    type or= Model.Field.NoOp
    value = undefined
    Object.defineProperty @prototype, name,
      get: -> type(value) if value
      set: (v) -> value = type(v)


module.exports = Model
