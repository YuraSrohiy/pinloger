# Запис в базу часу, через скільки робиться анлогін при неактивності

Template.Profile.events
  'click .set-idle': () ->
    idle = $('[name=idle]').val()
    id = IdleTime.findOne()._id
    IdleTime.update(
      {_id: id},
      {$set:
        {
          itime:idle
        }
      }
    )