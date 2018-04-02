class RemoveAgreementsUsersRelation < ActiveRecord::Migration[5.1]
  def change
    drop_table :agreements_users
  end
end
