class DeviceType < ApplicationRecord
  has_many :device_brands

  validates :name, presence: true
end
