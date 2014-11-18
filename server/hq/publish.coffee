Meteor.startup ->
  Meteor.publish 'users', -> Meteor.users.find()
  Meteor.publish null, -> Meteor.roles.find()
