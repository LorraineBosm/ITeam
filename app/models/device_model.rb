class DeviceModel < ApplicationRecord
  belongs_to :device_brand

  validates :name, presence: true
  validates :code, presence: true
end
