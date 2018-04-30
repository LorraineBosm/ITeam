class DeviceModel < ApplicationRecord
  belongs_to :device_brand

  has_many :requests
  has_many :agreements

  validates :name, presence: true
end
