class User < ApplicationRecord
  has_and_belongs_to_many :roles
  has_many :accepted_agreements, class_name: 'Agreement', foreign_key: 'acceptor_id'
  has_many :repaired_agreements, class_name: 'Agreement', foreign_key: 'technician_id'
  has_many :agreements_users
  has_many :agreements, through: :agreements_users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
