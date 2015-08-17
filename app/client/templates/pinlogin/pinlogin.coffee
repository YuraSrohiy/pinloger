Template.PinLogin.helpers
  getUsername: () ->
    usrname = Session.get 'sw-user'
    usrname

Template.PinLogin.events
  'submit form': (e) ->
    e.preventDefault()
    username = $('[name=username]').val()
    pincode = $('[name=pincode]').val()
    if Tokens.findOne(username: username).pintry >= 4
      alert 'Invalid pincode 4 times. You must sign in by your password'
      Router.go 'login'
    else
      if Meteor.users.findOne(username:username).profile.pincode == pincode
        tId = Tokens.findOne(username: username)._id
        token = Tokens.findOne(username: username).token
        pintry = 0
        Tokens.update(
          {_id: tId},
          {$set:
            {
              pintry: pintry
            }
          }
        )
        Meteor.loginWithToken token, (err, res) ->
        Router.go('profile')
      else
        tId = Tokens.findOne(username: username)._id
        pintry = Tokens.findOne(username: username).pintry + 1
        Tokens.update(
          {_id: tId},
          {$set:
            {
              pintry: pintry
            }
          }
        )
        alert("Invalid pincode")

Template.PinLogin.onRendered () ->
  Meteor.subscribe('tokens')
  Meteor.logout()