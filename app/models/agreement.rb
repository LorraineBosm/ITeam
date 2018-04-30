class Agreement < ApplicationRecord
  enum status: [:untouched, :in_repair, :repaired]

  belongs_to :device_model, optional: true
  has_one :request
  belongs_to :acceptor, class_name: 'User', foreign_key: 'acceptor_id'
  belongs_to :technician, class_name: 'User', foreign_key: 'technician_id', optional: true
  has_many :agreement_user
  has_many :users, through: :agreement_user
end
