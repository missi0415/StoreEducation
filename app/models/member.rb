class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :group
  attachment :image 
  has_many :educations
  has_many :tasks
  has_many :abilities
  has_many :group_messages
end
