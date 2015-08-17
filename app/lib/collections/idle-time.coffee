@IdleTime = new Mongo.Collection "idleTime"

IdleTime.allow
  insert: -> true
  update: -> true