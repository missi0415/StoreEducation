class Group < ApplicationRecord
  belongs_to :manager
  has_many :members
  has_many :group_messages
  has_many :ability_titles
  attachment :group_image
  
  validates :manager_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
end
