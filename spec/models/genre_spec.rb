require 'rails_helper'

RSpec.describe Genre, type: :model do
  it "有効な投稿内容の場合は保存されるか" do
    genre = FactoryBot.build(:genre)
    expect(genre).to be_valid
  end

  it "nameが空白" do
    genre = FactoryBot.build(:anime, name:"")
    expect(genre).to be_invalid
    expect(genre.errors[:name]).to include("を入力してください")
  end
end
