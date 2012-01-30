require 'delegate'
require 'active_support'

class ApplicationDecorator < SimpleDelegator
  include ActiveSupport::Inflector

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
