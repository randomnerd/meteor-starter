Template.hq_user.events =

  'click .addRole .item': -> Meteor.call 'usersAddRole', @user._id, @role.name

Template.hq_role.events
  'click .removeRole': -> Meteor.call 'usersRemoveRole', @user._id, @role

Template.hq_roles_dropdown.rendered = ->
  @$('.addRole.dropdown').dropdown { action: 'hide' }

Template.hq_roles_dropdown.helpers
  availRoles: -> Meteor.roles.find({name: {$nin: @roles || []}})
