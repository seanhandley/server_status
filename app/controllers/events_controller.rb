class EventsController < ApplicationController
  def index
    @active_events = Event.active.map {|e| EventDecorator.new(e)}
    @scheduled_events = Event.scheduled.map {|e| EventDecorator.new(e)}
    @resolved_events = Event.resolved.map {|e| EventDecorator.new(e)}
    @overall_status = Status.overall_status
  end
end