class Ability < ApplicationRecord
  belongs_to :member
  belongs_to :ability_title
  
  validates :member_id, presence: true
  validates :ability_title_id, presence: true
  validates :value, presence: true, length: { maximum: 3 }
end
