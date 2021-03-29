class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :token
      t.integer :registrations_count, default: 0

      t.timestamps
    end
    add_index :users, :token, unique: true
  end
end
