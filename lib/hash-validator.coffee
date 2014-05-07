sha1 = require 'sha1'

module.exports =
  hashIsValid: (secret, userData) ->
    expectedHash = sha1(secret + userData.user_id)
    providedHash = userData.user_hash
    expectedHash is providedHash
