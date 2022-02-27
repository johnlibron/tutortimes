class CreateTimeSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :time_slots do |t|
      t.string :name
      t.datetime :begins_at
      t.datetime :ends_at
      t.integer :registrations_count, default: 0
      t.integer :capacity, default: 0
      t.timestamps
    end
  end
end
