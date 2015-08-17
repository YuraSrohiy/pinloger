Template.Registration.events
  'submit form': (e) ->
    e.preventDefault()
    email = $('[name=at-field-email]').val()
    username = $('[name=at-field-username]').val()
    password = $('[name=at-field-password]').val()
    pincode = $('[name=at-field-pincode]').val()
    Session.set "username", username
    Meteor.subscribe('users')
    if Meteor.isServer
      Accounts.createUser
        email: email
        password: password
        username: username
        profile:
          pincode: pincode
      ,
        (err) ->
    setTimeout (->
      if Meteor.user()
        Router.go 'profile'
    ), 1000
    
    if Meteor.user()
      Router.go 'profile'
Template.Registration.onRendered () ->
  Meteor.logout()