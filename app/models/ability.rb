class Ability < ApplicationRecord
  belongs_to :member
  belongs_to :ability_title
  
  validates :value, length: { maximum: 3}
end
