class CreateDeviceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :device_types do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
