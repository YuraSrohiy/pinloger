Router.route '/register',
  name: 'register'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'Registration'
  waitOn: () ->
    Meteor.subscribe('users')

Router.route '/',
  name: 'Home'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'Home'

Router.route '/login',
  name: 'login'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'Login'
  waitOn: () ->
    Meteor.subscribe('users')

Router.route '/profile',
  name: 'profile'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'Profile'

Router.route '/pinlogin',
  name: 'pinlogin'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'PinLogin'
  waitOn: () ->
    Meteor.subscribe('users')