Template.eventPage.helpers({
    currentEvent: function() {
        return Events.findOne(Session.get('currentEventId'));
    }
});