class Event < ActiveRecord::Base
  # Attributes
  attr_accessible :title, :description, :status

  # Associations
  has_many :updates, :dependent => :delete_all
  belongs_to :status

  # Validations
  validates_length_of :title, :within => 1..30
  validates_length_of :description, :within => 1..1000
  validates_presence_of :status

  # Properties
  def scheduled?
   !!scheduled_for
  end

  # Methods
  def create_update(update_text)
    updates.create(description: update_text)
  end

end