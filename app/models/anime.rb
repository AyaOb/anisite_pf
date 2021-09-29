class Anime < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy

  attachment :image
  
  acts_as_taggable

  def self.search(keyword)
    where(["name like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
