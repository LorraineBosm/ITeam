class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :role
    create_table :roles do |t|
      t.integer :name, null: false
      t.timestamps
    end

    create_join_table :users, :roles do |t|
      t.index :user_id
      t.index :role_id
    end
  end
end
