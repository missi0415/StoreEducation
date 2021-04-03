class Task < ApplicationRecord
  belongs_to :member
  enum member_status: { "未着手": 0, "実施中": 1, "完了": 2}
  enum manager_status: { "未確認": 0, "確認済み": 1}
end
