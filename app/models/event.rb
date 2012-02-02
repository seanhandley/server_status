class Event < ActiveRecord::Base
  # Attributes
  attr_accessible :title, :description, :status,
                  :scheduled_for, :updated_at, :resolved_at,
                  :status_id, :user

  # Associations
  has_many :updates, :dependent => :delete_all
  belongs_to :status
  belongs_to :user

  # Validations
  validates_length_of :title, :within => 1..30
  validates_length_of :description, :within => 1..1000
  validates_presence_of :status

  # Scopes
  scope :resolved,  lambda { where("resolved_at IS NOT NULL") }
  scope :active,    lambda { where("resolved_at IS NULL AND scheduled_for IS NULL") }
  scope :scheduled, lambda { where("resolved_at IS NULL AND scheduled_for IS NOT NULL") }

  # Properties
  def scheduled?
   !!scheduled_for
  end

  def resolved?
   !!resolved_at
  end

  # Methods
  def create_update(update_text, user)
    self.updates.create(description: update_text, user: user)
    self.updated_at = Time.now
    self.save
  end

  def resolve
    self.resolved_at = Time.now
  end

end