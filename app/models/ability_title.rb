class AbilityTitle < ApplicationRecord
  belongs_to :group
  has_many :abilities ,dependent: :destroy
end
