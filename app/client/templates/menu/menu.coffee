Template.Menu.events
  'click .logout-btn': (e) ->
    e.preventDefault()
    Meteor.logout()
    Router.go('login')


Template.Menu.helpers
  getUsername: () ->
    Meteor.user().username
  getUsers: () ->
    Meteor.subscribe 'users'
    us = Meteor.users.find({roles: undefined}, {sort: {username: 1}}).fetch()
    us

Template.MenuItem.events
  'click .sw-item-btn': (e) ->
    e.preventDefault()
    username = Template.currentData().username
    Meteor.logout()
    Session.set 'sw-user', username
    Router.go('pinlogin')