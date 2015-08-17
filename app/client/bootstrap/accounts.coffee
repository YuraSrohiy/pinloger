AccountsTemplates.configure
  forbidClientAccountCreation: true

AccountsTemplates.addField
  _id: 'pincode'
  type: 'password'
  required: true
  errStr: 'invalid pincode'
  re: /^[0-9]{4}$/

AccountsTemplates.addField
  _id: 'username'
  type: 'text'
  required: true