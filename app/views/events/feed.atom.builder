atom_feed :language => 'en-GB' do |feed|
  feed.title "Melbourne Server Status"
  feed.updated Time.now

  @all_events.each do |event|
    feed.entry( event ) do |entry|
      entry.url url_for :only_path => false, :controller => 'events', :action => 'show', :id => event.id
      entry.title event.title
      entry.content event.description, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(event.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
      entry.author 'Melbourne Support'
    end
  end
end