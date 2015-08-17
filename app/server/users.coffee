Meteor.startup ->
  usersNum = Meteor.users.find().count()
  unless usersNum
    userId = Accounts.createUser
      username: 'admin'
      password: 'admin'
      email: 'admin@projectx.com'
      profile:
        pincode: "0000"
    Roles.addUsersToRoles userId, 'admin'