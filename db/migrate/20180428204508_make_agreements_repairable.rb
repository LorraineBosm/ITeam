class MakeAgreementsRepairable < ActiveRecord::Migration[5.1]
  def change
    add_column :agreements, :status, :integer, default: 0, null: false
    add_column :agreements, :percentage, :integer
  end
end
