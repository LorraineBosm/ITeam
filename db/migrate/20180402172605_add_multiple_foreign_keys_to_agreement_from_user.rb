class AddMultipleForeignKeysToAgreementFromUser < ActiveRecord::Migration[5.1]
  def change
    add_column :agreements, :acceptor_id, :integer, index: true
    add_foreign_key :agreements, :users, column: :acceptor_id

    add_column :agreements, :technician_id, :integer, index: true, null: true
    add_foreign_key :agreements, :users, column: :technician_id

    change_column :agreements, :acceptor_id, :integer, index: true, null: false
  end
end
