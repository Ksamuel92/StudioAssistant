class CreateClientsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :clients_users do |t|
      t.integer :user_id
      t.integer :client_id
    end
  end
end
