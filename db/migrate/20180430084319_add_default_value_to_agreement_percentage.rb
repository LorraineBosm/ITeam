class AddDefaultValueToAgreementPercentage < ActiveRecord::Migration[5.1]
  def change
    change_column :agreements, :percentage, :integer, null: false, default: 0
  end
end
