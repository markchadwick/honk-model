expect  = require('chai').expect

Model = require 'model'


class Named extends Model
  @field 'name', @Field.String

class Numbered extends Model
  @field 'count', @Field.Int

describe 'Models', ->

  it 'should be created with a simple defintion', ->
    named = new Named()
    expect(named).to.exist

  it 'should have settable fields', ->
    named = new Named()

    expect(named.name).to.not.exist
    named.name = 'Stevie'
    expect(named.name).to.equal 'Stevie'

  it 'should coerse fields to the proper type', ->
    named = new Named()
    named.name = 666
    expect(named.name).to.not.equal 666
    expect(named.name).to.equal '666'

  it 'should complain when getting an uncoerceable type', ->
    numbered = new Numbered()
    badSet = -> numbered.count = 'too many!'
    expect(badSet).to.throw(Error, "Invalid int, 'too many!'")
    expect(numbered.count).to.not.exist
