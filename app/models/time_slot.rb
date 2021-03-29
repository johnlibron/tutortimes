class TimeSlot < ApplicationRecord
  has_many :registrations, dependent: :destroy, inverse_of: :time_slot
  has_many :users, through: :registrations

  scope :ordered, -> { order(:begins_at, :ends_at) }
  scope :upcoming, -> { where(begins_at: Time.now..) }

  validates :begins_at, presence: true
  validates :ends_at, presence: true
end
