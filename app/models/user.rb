class User < ActiveRecord::Base

  # Behaviours
  has_secure_password

  # Validations
  validates :password, :presence => { :on => :create }

  # Associations
  has_many :events
  has_many :updates
end