Template.navUserMenu.rendered = -> @$('.dropdown').dropdown({ action: 'hide' })
Template.nav.events
  'click #logout': -> Meteor.logout()
Template.navLoginMenu.rendered = ->
  @$('.login').popup
    on: 'click'
    inline: true
    hoverable: true
    position: 'bottom right'
    hideOnScroll: false
    delay: { show: 300, hide: 1000 }
