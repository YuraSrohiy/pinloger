@Tokens = new Mongo.Collection "tokens"

Tokens.allow
  insert: -> true
  update: -> true