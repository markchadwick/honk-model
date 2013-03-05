expect  = require('chai').expect

Fields = require 'fields'


describe 'String Field', ->
  it 'should convert simple types to string', ->
    expect(Fields.String('abc')).to.equal 'abc'
    expect(Fields.String(123)).to.equal '123'
    expect(Fields.String(4.56)).to.equal '4.56'
    expect(Fields.String(0)).to.equal '0'
    expect(Fields.String(false)).to.equal 'false'

  it 'should not convert undefined', ->
    expect(Fields.String(undefined)).to.not.exist


describe 'Int Field', ->
  it 'should not convert int types', ->
    expect(Fields.Int(1)).to.equal 1
    expect(Fields.Int(0)).to.equal 0
    expect(Fields.Int(-1)).to.equal -1

  it 'should convert obvious strings', ->
    expect(Fields.Int('123')).to.equal 123
    expect(Fields.Int('-666')).to.equal -666
    expect(Fields.Int('0')).to.equal 0

  it 'should throw an error for bad values', ->
    badSet = -> Fields.Int('bad int!')
    expect(badSet).to.throw(Error, "Invalid int, 'bad int!'")

  it 'should round floating point values', ->
    expect(Fields.Int(1.0)).to.equal 1
    expect(Fields.Int(1.1)).to.equal 1
    expect(Fields.Int(1.49)).to.equal 1
    expect(Fields.Int(1.5)).to.equal 2
    expect(Fields.Int(0.0)).to.equal 0

  it 'should convert floating point strings', ->
    expect(Fields.Int('1.0')).to.equal 1
    expect(Fields.Int('-1.3')).to.equal -1
    expect(Fields.Int('0.0')).to.equal 0
