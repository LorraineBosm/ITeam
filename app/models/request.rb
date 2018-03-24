class Request < ApplicationRecord
  attr_accessor :device_type, :device_brand

  belongs_to :device_model

  validates :problem_desc, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :device_model_id, presence: true

end
