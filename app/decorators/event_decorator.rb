class EventDecorator < ApplicationDecorator
  def abridged_description
    truncate(model.description, 90)
  end

  def last_updated
    model.updated_at.strftime("%H:%m:%S %a #{ordinalize(model.updated_at.day)} %B %Y")
  end
end