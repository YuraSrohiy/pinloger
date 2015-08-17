Template.Login.events
  'submit form': (e) ->
    e.preventDefault()
    username = $('[name=username]').val()
    password = $('[name=password]').val()
    log_user = Meteor.users.findOne(username: username).username
    Session.set 'username', log_user
    Meteor.subscribe('tokens')
    Meteor.loginWithPassword username, password, (err) ->
      if err
        console.log err.reason
      else
        tId = Tokens.findOne(username: username)._id
        pintry = 0
        Tokens.update(
          {_id: tId},
          {$set:
            {
              pintry: pintry
            }
          }
        )
        Router.go('profile')

Template.Login.onRendered () ->
  Meteor.logout()