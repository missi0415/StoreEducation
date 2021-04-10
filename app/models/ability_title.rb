class AbilityTitle < ApplicationRecord
  belongs_to :group
  has_many :abilities ,dependent: :destroy
  
  validates :group_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
end
