_       = require 'lodash'
events  = require 'honk-events'


class Model
  @Field = require './fields'

  @field: (name, type) ->
    type or= Model.Field.NoOp
    prop =
      get: -> type(@_fields[name]) if @_fields[name]
      set: (v) -> @_fields[name] = type(v)

    Object.defineProperty @prototype, name, prop
    (this['_field_names'] or= []).push(name)

  constructor: (initParams) ->
    events(this)

    @_fields = {}
    @update(initParams) if initParams?

  update: (params) ->
    fieldNames = @constructor._field_names
    @[k] = v for k, v of params when k in fieldNames


module.exports = Model
