Meteor.checkAdmin = ->
  return false unless user = Meteor.user()
  return false unless Roles.userIsInRole user._id, 'admin'
  return true

Meteor.methods
  usersToggleAdmin: (userId) -> Meteor.call 'toggleRole', userId, 'admin'
  usersToggleBan: (userId) ->
    return false unless Meteor.checkAdmin()
    unless Roles.userIsInRole userId, 'banned'
      Meteor.users.update userId, { $set: { 'services.resume.loginTokens': [] } }
    Meteor.call 'toggleRole', userId, 'banned'

  usersToggleRole: (userId, role) ->
    return false unless Meteor.checkAdmin()
    if Roles.userIsInRole userId, role
      Roles.removeUsersFromRoles userId, [role]
    else
      Roles.addUsersToRoles userId, [role]

  usersAddRole: (userId, role) ->
    return false unless Meteor.checkAdmin()
    Roles.addUsersToRoles userId, [role]

  usersRemoveRole: (userId, role) ->
    return false unless Meteor.checkAdmin()
    Roles.removeUsersFromRoles userId, [role]

