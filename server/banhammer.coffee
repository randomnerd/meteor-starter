Accounts.validateLoginAttempt (attempt) ->
  return false if Roles.userIsInRole attempt.user?._id, 'banned'
  return true
