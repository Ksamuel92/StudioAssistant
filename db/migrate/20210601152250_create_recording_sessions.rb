class CreateRecordingSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :recording_sessions do |t|
      t.date :start_date
      t.date :end_date
      t.float :per_hour
      t.integer :hours_per_day
      t.text :specialized_gear
      t.integer :user_id
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
