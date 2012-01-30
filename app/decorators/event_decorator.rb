class EventDecorator < ApplicationDecorator
  include DateDecorator
  def abridged_description
    truncate(model.description, 90)
  end

  def timestamp
    "#{attribute.to_s.humanize.titleize} #{formatted_date(model.send(attribute))}"
  end

  private

  def attribute
    return :resolved_at if model.resolved?
    return :scheduled_for if model.scheduled?
    :updated_at
  end
end