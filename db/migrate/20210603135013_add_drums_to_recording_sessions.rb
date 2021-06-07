class AddDrumsToRecordingSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :recording_sessions, :drums?, :boolean
  end
end
