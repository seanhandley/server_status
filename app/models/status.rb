class Status < ActiveRecord::Base
  # Attributes
  attr_accessible :title, :priority

  # Associations
  has_many :events

  # Validations
  validates_length_of :title, :within => 1..30

  # Scopes
  scope :highest_active_status,
    lambda { where('resolved_at IS NULL AND scheduled_for IS NULL').joins(
      :events).order('priority').all(limit: 1) }
  scope :lowest_status, lambda { order('priority DESC').all(limit: 1) }

  # Methods
  def self.overall_status
    return highest_active_status.first.title if highest_active_status.count > 0
    return lowest_status.first.title if lowest_status.count > 0
    'all_ok'
  end

end