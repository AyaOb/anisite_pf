class Anime < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy

  attachment :image

  acts_as_taggable

  validates :name, presence: true
  validates :genre, presence: true
  validates :image, presence: true
  validates :quote, presence: true
  validates :quote_url, presence: true
  validates :introduction, presence: true

  def self.search(keyword)
    where(["name like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
