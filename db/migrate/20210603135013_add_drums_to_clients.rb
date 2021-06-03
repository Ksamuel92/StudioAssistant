class AddDrumsToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :drums?, :boolean
  end
end
