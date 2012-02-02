Status.all.each{|s| s.destroy }
Status.create! title: 'major_issue', priority: 1
Status.create! title: 'minor_issue', priority: 2
Status.create! title: 'all_ok', priority: 3
Event.all.each{|e| e.destroy }
Event.create(title: "Alien invasion",
             description: "After spotting lights above the data centre it turns
              out earth is being invaded by a hostile species.",
             status: Status.find_by_title('major_issue'))
event = Event.create(title: "It's all gone wrong",
             description: "Zomg what are we going to do?!?!?! All of the servers
             have exploded violently in a cloud of dust.",
             status: Status.find_by_title('major_issue'))
event.create_update("Went into the server room. It's a real mess in there. Bits of
server all over the place, clouds of smoke, crying children. Mass hysteria.")
event.create_update("Attempting to rebuild servers with duct tape. Going well so
far. Maybe a few tin cans and some bubble gum will help too.")
event.updated_at = Time.now + 1.minutes
event.save
Event.create(title: "Planned maintenance",
             description: "Flux capacitor needs a good wash after that last trip.
              Don't forget to use shampoo and conditioner.",
             status: Status.find_by_title('minor_issue'),
             scheduled_for: Time.now + 7.days)
Event.create(title: "Planned maintenance",
             description: "The configurator needs rejigging so we are installing
              a RAM, adding lots of Herz and cleaning out the tubes.",
             status: Status.find_by_title('minor_issue'),
             scheduled_for: Time.now + 14.days)
event = Event.create(title: "Bees in the server room",
             description: "Need a better place to make our honey. It's really
              tasty but the stings are so painful.",
             status: Status.find_by_title('all_ok'),
             resolved_at: Time.now - 4.days)
event.save
event = Event.create(title: "Elephants in the server room",
             description: "They have great memories but they're not so good
              at avoiding trailing wires.",
             status: Status.find_by_title('all_ok'),
             resolved_at: Time.now - 3.days)
event.save
event = Event.create(title: "Badgers in the server room",
             description: "We really honestly don't know why animals like our
              server room so much. It's weird.",
             status: Status.find_by_title('all_ok'),
             resolved_at: Time.now - 2.days)
event.save
event = Event.create(title: "Unicorns in the server room",
             description: "How did unicorns get in here? Now there's rainbows
              and fairy dust all over the cabinets.",
             status: Status.find_by_title('all_ok'),
             resolved_at: Time.now - 1.days)
event.save

User.all.each {|u| u.destroy }
User.create(username: 'melbourne_support', password: 'password')
Event.all.each{|e| e.user = User.first; e.save }
Update.all.each{|u| u.user = User.first; u.save }