class Agreement < ApplicationRecord
  enum status: [:untouched, :in_repair, :repaired]
  has_one :request
  belongs_to :acceptor, class_name: 'User', foreign_key: 'acceptor_id'
  belongs_to :technician, class_name: 'User', foreign_key: 'technician_id', optional: true
end
