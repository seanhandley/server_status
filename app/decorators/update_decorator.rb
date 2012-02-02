class UpdateDecorator < ApplicationDecorator
  include DateDecorator

  def timestamp
    "Updated At #{formatted_date(model.updated_at)}"
  end

end