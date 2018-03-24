class FixDeviceBrandsBelongsToRelation < ActiveRecord::Migration[5.1]
  def change
    remove_column :device_brands, :device_brand_id
    add_reference :device_brands, :device_type
  end
end
