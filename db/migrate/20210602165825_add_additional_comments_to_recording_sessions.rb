class AddAdditionalCommentsToRecordingSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :recording_sessions, :additional_comments, :text
  end
end
