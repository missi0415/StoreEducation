class Education < ApplicationRecord
  belongs_to :member
  
  validates :member_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 200 }
  validates :progress, length: { maximum: 3 }
end
