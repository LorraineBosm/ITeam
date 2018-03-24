class Request < ApplicationRecord
  attr_accessor :device_type, :device_brand

  belongs_to :device_model, optional: true

  validates :problem_desc, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

end
