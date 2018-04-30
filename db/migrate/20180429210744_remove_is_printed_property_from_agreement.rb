class RemoveIsPrintedPropertyFromAgreement < ActiveRecord::Migration[5.1]
  def change
    remove_column :agreements, :is_printed
  end
end
