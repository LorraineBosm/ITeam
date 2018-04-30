class AddUniqueIndexOnUsersAgreements < ActiveRecord::Migration[5.1]
  def change
    add_index :agreements_users, [:user_id, :agreement_id], unique: true
  end
end
