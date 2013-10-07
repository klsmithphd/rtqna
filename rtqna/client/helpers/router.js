Meteor.Router.add({
    '/': 'eventsList',

    '/events/:_id': {
        to: 'eventPage',
        and: function(id) { Session.set('currentEventId', id);}
    }
});