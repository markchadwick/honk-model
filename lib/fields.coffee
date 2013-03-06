_ = require 'lodash'

class FieldDef

class StringFieldDef extends FieldDef
  convert: (v) -> String(v) if v?

module.exports =
  NoOp:   (v) -> v
  String: (v) -> String(v) if v?
  Int:    (v) ->
    switch typeof v
      when 'number' then Math.round(v)
      when 'string'
        parsed = parseInt(v, 10)
        if not _.isNaN(parsed) then parsed
        else throw Error("Invalid int, '#{v}'")
      else
        throw Error("Invalid in type, '#{(typeof v)}'")
