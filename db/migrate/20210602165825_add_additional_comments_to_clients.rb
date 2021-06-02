class AddAdditionalCommentsToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :additional_comments, :text
  end
end
