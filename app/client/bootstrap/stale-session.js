var heartbeatInterval = 1000
var counter = 0
var activityEvents = 'mousemove click keydown';

var activityDetected = false;

// Some code copypasted from zuuk:stale-ssession package

Meteor.startup(function() {
    Meteor.subscribe('idle-time');
    Meteor.setInterval(function() {
        if (Meteor.userId() && activityDetected) {
            counter=0;
            activityDetected = false;
        }
        else if (Meteor.userId())
        {
            counter++;
            //console.log("counter=>", counter)
            if (counter == IdleTime.findOne().itime) {
                Session.set('sw-user', Meteor.user().username);
                Meteor.logout();
                counter = 0;
                if (Session.get('sw-user') == 'admin'){
                    Router.go('login');
                }
                else{
                    Router.go('pinlogin')
                }

            };
        }
    }, heartbeatInterval)

    $(document).on(activityEvents, function() {
       activityDetected = true;
    });

});