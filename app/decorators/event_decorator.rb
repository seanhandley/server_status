class EventDecorator < ApplicationDecorator
  def abridged_description
    truncate(model.description, 90)
  end

  def last_updated
    model.updated_at.strftime('%a %d %B %Y %H:%m:%S')
  end
end