class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :anime
  has_many :likes, dependent: :destroy

end
