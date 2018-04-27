class DeviceModel < ApplicationRecord
  belongs_to :device_brand
  has_one :request

  validates :name, presence: true
end
