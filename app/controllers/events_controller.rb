class EventsController < ApplicationController
  def index
    @active_events = Event.active.all(limit: 2).map {|e| EventDecorator.new(e)}
    @scheduled_events = Event.scheduled.all(limit: 2).map {|e| EventDecorator.new(e)}
    @resolved_events = Event.resolved.all(limit: 4).map {|e| EventDecorator.new(e)}
    @overall_status = Status.overall_status
  end

  def show
    @event = EventDecorator.new(Event.find(params[:id]))
  end

end