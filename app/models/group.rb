class Group < ApplicationRecord
  belongs_to :manager
  has_many :members
  has_many :group_messages
  has_many :group_abilty_titl
  attachment :group_image
end
