Accounts.onLogin () ->
  loginToken = Accounts._storedLoginToken()
  username = Session.get 'username'
  #Перевіряю чи токени змінилися. Якщо так, то обновляю їх в базі
  Meteor.subscribe('tokens')
  if !Tokens.findOne(username: username)
    Tokens.insert {username: username, token: loginToken, pintry: 0}
  else if Tokens.findOne(username: username).token != loginToken
    tId = Tokens.findOne(username: username)._id
    Tokens.update(
      {_id: tId},
      {$set:
        {
          token:loginToken
        }
      }
    )
  Session.set 'username', ''

Meteor.logout = () ->
  Meteor._localStorage.removeItem "Meteor.loginToken"
  Meteor._localStorage.removeItem "Meteor.loginTokenExpires"
  Meteor._localStorage.removeItem "Meteor.userId"

  Accounts.connection.setUserId null
  Accounts.connection.onReconnect = null