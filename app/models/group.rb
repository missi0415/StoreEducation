class Group < ApplicationRecord
  belongs_to :manager
  has_many :members
end
