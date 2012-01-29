class Update < ActiveRecord::Base
  # Attributes
  attr_accessible :description, :event

  # Associations
  belongs_to :event

  # Validations
  validates_length_of :description, :within => 1..1000
  validates_presence_of :event
end