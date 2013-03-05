_       = require 'lodash'
events  = require 'honk-events'


class Model
  @Field = require './fields'

  @field: (name, type) ->
    type or= Model.Field.NoOp
    value = undefined
    Object.defineProperty @prototype, name,
      get: -> type(value) if value
      set: (v) -> value = type(v)

  constructor: (initParams) ->
    events(this)

    @update(initParams) if initParams?

  update: (params) ->
    (@[k]?.set?(v) for k, v of params)


module.exports = Model
