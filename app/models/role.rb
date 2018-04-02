class Role < ApplicationRecord
  enum name: [:customer, :acceptor, :analyst, :technician, :admin]

  has_and_belongs_to_many :users
end
