hamlc = require 'haml-coffee'

require.extensions['.haml'] = (module, filename) ->
  console.log '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1', filename, module
  console.log '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  console.log hamlc
  # module._compile(hem.compilers.haml(filename))
  console.log hamlc.compile

console.log '----------------------------------------------------------'
console.log require.extensions
console.log '----------------------------------------------------------'

render = require 'render'

describe 'Render', ->
  beforeEach ->

  it 'render basic HAML', ->
    template = require './basic'
    console.log '@@@@Template@@@@', template
