class AgreementsUser < ApplicationRecord
  belongs_to :agreement
  belongs_to :user

  validates_uniqueness_of :agreement_id, scope: :user_id
end