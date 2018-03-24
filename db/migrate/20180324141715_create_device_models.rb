class CreateDeviceModels < ActiveRecord::Migration[5.1]
  def change
    create_table :device_models do |t|
      t.string :name, null: false # Galaxy S7
      t.string :code # GT-S5830
      t.belongs_to :device_brand
      t.timestamps
    end
  end
end
