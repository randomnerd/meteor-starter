Router.configure
  layoutTemplate: 'appLayout'
  loadingTemplate: 'loading'

Router.checkAdmin = ->
  user = Meteor.user()
  if user && Roles.userIsInRole user._id, 'admin'
    @next()
  else
    @render 'home'

Router.checkUser = ->
  if Meteor.userId() then @next() else @render 'home'

Router.onBeforeAction Router.checkAdmin,
  only: [ 'hqUsers' ]

Router.onBeforeAction Router.checkUser,
  only: [ 'profile' ]

Router.route '/', name: 'home'
Router.route '/profile', name: 'profile'
Router.route '/hq/users',
  waitOn: -> Meteor.subscribe 'users'
  name: 'hqUsers'
  data:
    users: -> Meteor.users.find()
    allRoles: -> Meteor.roles.find()
