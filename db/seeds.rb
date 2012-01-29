Status.all.each{|s| s.destroy }
Status.create! title: 'major_issue', priority: 1
Status.create! title: 'minor_issue', priority: 2
Status.create! title: 'all_ok', priority: 3
Event.all.each{|e| e.destroy }
Event.create(title: "It's all gone wrong",
             description: "Zomg what are we going to do?!?!?! All of the servers
             have exploded violently in a cloud of dust.",
             status: Status.find_by_title('major_issue'))
Event.create(title: "Planned maintenance",
             description: "Flux capacitor needs a good wash after that last trip.
              Don't forget to use shampoo and conditioner.",
             status: Status.find_by_title('minor_issue'),
             scheduled_for: Time.now + 7.days)
event = Event.create(title: "Bees in the server room",
             description: "Need a better place to make our honey. It's really
              tasty but the stings are so painful.",
             status: Status.find_by_title('major_issue'))
event.resolve
event.save