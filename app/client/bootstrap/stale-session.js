var heartbeatInterval = 1000
var counter = 0
var activityEvents = 'mousemove click keydown';

var activityDetected = false;

// Частина коду скопіпащена з пакету тому джаваскріпт
// Принцип роботи: Кожної секунди робиться перевірка чи була зроблена якась дія.
// Якщо так, то каунтер обуляється, якщо ні то плюсується. Таким чином в каунтері
// зберігається кількість неактивних секунд і порівнюється з числом в базі, якщо каунтер
// доходить до тоого числа то робиться логаут і обнуляється каунтер

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