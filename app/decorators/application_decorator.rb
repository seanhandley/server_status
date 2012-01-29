require 'delegate'

class ApplicationDecorator < SimpleDelegator

  def initialize(klass)
    @model = klass
    super(klass)
  end

  def class
    model.class
  end

  def truncate(content, length, omission='...')
    ActionController::Base.helpers.truncate(content, length: length, omission: omission)
  end

  private

  def model
    @model
  end

end
