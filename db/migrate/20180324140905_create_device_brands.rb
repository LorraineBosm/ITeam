class CreateDeviceBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :device_brands do |t|
      t.string :short_name, null: false
      t.string :full_name, null: false
      t.belongs_to :device_brand
      t.timestamps
    end
  end
end
