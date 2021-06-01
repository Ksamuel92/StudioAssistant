class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.boolean :band?
      t.string :genre
      t.boolean :has_producer?
      t.float :budget

      t.timestamps null: false
    end
  end
end
