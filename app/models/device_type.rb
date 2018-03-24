class DeviceType < ApplicationRecord
  has_many :device_brands
  has_many :device_models, through: :device_brands

  validates :name, presence: true
end
