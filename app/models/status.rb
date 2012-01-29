class Status < ActiveRecord::Base
  # Attributes
  attr_accessible :title

  # Associations
  has_many :events

  # Validations
  validates_length_of :title, :within => 1..30
end