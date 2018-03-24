class DeviceBrand < ApplicationRecord
  belongs_to :device_type
  has_many :device_models

  validates :short_name, presence: true
  validates :full_name, presence: true
end
