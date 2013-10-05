if (Events.find().count() === 0) {
  Events.insert( {
    title: 'Group Discussion',
  });

  Events.insert({
    title: 'Town Hall Meeting',
  });
  
  Events.insert({
    title: 'Food for Thought',
  });
}