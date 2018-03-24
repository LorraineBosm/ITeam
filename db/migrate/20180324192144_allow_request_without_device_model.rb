class AllowRequestWithoutDeviceModel < ActiveRecord::Migration[5.1]
  def change
    change_column_null :requests, :device_model_id, true
  end
end
