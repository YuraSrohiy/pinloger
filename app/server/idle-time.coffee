# Якщо в базі не заданий час виходу з аккаунту при неактивності,
# то задається за замовчуванням 10 секунд (для зручності зробив мало. щоб перевіряти)
Meteor.startup ->
  if (IdleTime.find().count() == 0)
    IdleTime.insert({itime: 10})
  