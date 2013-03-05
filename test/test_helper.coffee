events  = require 'honk-events'


beforeEach ->
  events(this)

afterEach ->
  @destroy()

module.exports = {}
