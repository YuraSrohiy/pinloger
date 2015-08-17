Meteor.publish 'users', () ->
  Meteor.users.find()

Meteor.publish 'tokens', () ->
  Tokens.find()

Meteor.publish 'idle-time', () ->
  IdleTime.find()