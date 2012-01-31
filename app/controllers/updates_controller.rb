class UpdatesController < ApplicationController
  before_filter :user_signed_in?
  def create
    event = Event.find(params[:update].delete(:event_id))
    event.create_update(params[:update][:description])
    redirect_to event_path(event.id)
  end
end