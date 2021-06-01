class CreateRecordingSessionstartDate:dates < ActiveRecord::Migration
  def change
    create_table :recording_session do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :per_hour
      t.integer :hours_per_day
      t.text :specialized_gear
      t.integer :user_id
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
