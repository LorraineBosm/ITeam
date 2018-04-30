class UsersAgreementsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :agreements do |t|
      t.index :user_id
      t.index :agreement_id
    end
  end
end
