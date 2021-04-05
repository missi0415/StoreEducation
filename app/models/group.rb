class Group < ApplicationRecord
  belongs_to :manager
  has_many :members
  has_many :group_messages
end
