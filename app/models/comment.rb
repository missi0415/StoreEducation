class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :group_message
end
