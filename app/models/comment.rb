class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :anime
  has_many :likes, dependent: :destroy

  # Likesテーブルにuserが存在するか
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
