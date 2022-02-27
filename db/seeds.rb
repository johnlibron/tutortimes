# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

time_slots = (0..10).map do
  name = Faker::Educator.unique.subject
  offset = [0, 1].sample.days + [0, 1, 2, 3].sample.hours
  duration = [30, 45, 60, 90].sample.minutes
  begins_at = 1.month.from_now.utc.at_noon + offset
  ends_at = begins_at + duration
  capacity = rand(5..10)
  TimeSlot.create!(name: name, begins_at: begins_at, ends_at: ends_at, capacity: capacity)
end

users = (0..10).map do
  email = Faker::Internet.unique.email
  name = email.split(/[._@]/).first.capitalize
  User.create!(name: name, email: email)
end

20.times do
  Registration.create(user: users.sample, time_slot: time_slots.sample)
end

puts "Seeded example time slots, users, and registrations"
