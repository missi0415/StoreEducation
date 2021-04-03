class GroupMessage < ApplicationRecord
  belongs_to :manager, optional: true
  belongs_to :group
  belongs_to :member, optional: true
end
