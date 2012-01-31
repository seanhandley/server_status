class EventsController < ApplicationController
  def index
    @active_events = Event.active.order('updated_at DESC').all(limit: 2).map {|e| EventDecorator.new(e)}
    @scheduled_events = Event.scheduled.order('scheduled_for').all(limit: 2).map {|e| EventDecorator.new(e)}
    @resolved_events = Event.resolved.order('resolved_at DESC').all(limit: 4).map {|e| EventDecorator.new(e)}
    @overall_status = Status.overall_status
  end

  def show
    @event = EventDecorator.new(Event.find(params[:id]))
  end

end