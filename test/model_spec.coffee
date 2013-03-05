tests   = require './test_helper'
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

  it 'should delegate events', (done) ->
    model = new Named()

    @on model, 'say', (name) ->
      expect(name).to.equal 'Frankie'
      done()

    model.trigger 'say', 'Frankie'

  it 'should be constructed with undefined values', ->
    named = new Named()
    expect(named.name).to.not.exist

  it 'should set fields initialized in the constructor', ->
    named = new Named()# name: 'Timothy') #, unused: 666)
    expect(named.name).to.equal 'Timothy'
    expect(named.unused).to.no.exist
