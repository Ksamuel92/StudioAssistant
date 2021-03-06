class CreateRecordingSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :recording_sessions do |t|
      t.string :start_date
      t.string :end_date
      t.integer :per_hour
      t.integer :hours_per_day
      t.text :specialized_gear
      t.integer :user_id
      t.integer :client_id
      t.boolean :band?
      t.boolean :has_producer?
      t.string :genre
      t.integer :budget

      t.timestamps null: false
    end
  end
end
