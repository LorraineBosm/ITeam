class DeviceBrand < ApplicationRecord
  belongs_to :device_type

  validates :short_name, presence: true
  validates :full_name, presence: true
end
