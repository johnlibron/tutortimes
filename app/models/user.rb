class User < ApplicationRecord
  has_many :registrations, dependent: :destroy, inverse_of: :user
  has_many :time_slots, -> { ordered }, through: :registrations

  validates :name, presence: true
  validates :email, presence: true
  validates :token, uniqueness: true

  before_validation :generate_token

  private def generate_token
    self.token ||= SecureRandom.base64(6).tr("+/", "-_")
  end
end
