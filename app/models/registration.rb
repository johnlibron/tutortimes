class Registration < ApplicationRecord
  belongs_to :user, counter_cache: :registrations_count, inverse_of: :registrations
  belongs_to :time_slot, counter_cache: :registrations_count, inverse_of: :registrations
end
