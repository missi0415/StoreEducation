class Education < ApplicationRecord
  belongs_to :member
  
  validates :member_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 300 }
  validates :progress, presence: true, length: { maximum: 3 }
end
