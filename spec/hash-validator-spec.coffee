hashValidator = require '../lib/hash-validator'

describe 'Hash Validator', ->
  it 'should return true when the hashes match', ->
    userData =
      user_id: 1
      user_hash: '00cafd126182e8a9e7c01bb2f0dfd00496be724f'

    outcome = hashValidator.hashIsValid 'secret', userData

    expect(outcome).toBe true

  it 'should return false when the hashes do not match', ->
    userData =
      user_id: 1
      user_hash: 'invalid'

    outcome = hashValidator.hashIsValid 'secret', userData

    expect(outcome).toBe false