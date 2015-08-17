Meteor.startup ->
  if (IdleTime.find().count() == 0)
    IdleTime.insert({itime: 10})
    
  