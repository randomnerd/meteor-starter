Meteor.autorun ->
  return unless user = Meteor.user()
  return unless user.roles
  Meteor.logout() if 'banned' in user.roles
