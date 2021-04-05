class GroupMessage < ApplicationRecord
  belongs_to :manager, optional: true
  belongs_to :group
  belongs_to :member, optional: true
  has_many :checks, dependent: :destroy
  has_many :comments, dependent: :destroy
  def checkd_by?(member)
    checks.where(member_id: member.id).exists?
  end
end
