Status.all.each{|s| s.destroy }
Status.create! title: 'major_issue'
Status.create! title: 'minor_issue'
Status.create! title: 'all_ok'