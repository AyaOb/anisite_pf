require 'rails_helper'

RSpec.describe Anime, type: :model do
  it "有効な投稿内容の場合は保存されるか" do
    anime = FactoryBot.build(:anime)
    expect(anime).to be_valid
  end

  it "nameが空白の場合バリデーションチェックされエラーメッセージが返ってきているか" do
    anime = FactoryBot.build(:anime, name:"")
    expect(anime).to be_invalid
    expect(anime.errors[:name]).to include("を入力してください")
  end

  it "imageが空白の場合バリデーションチェックされエラーメッセージが返ってきているか" do
    anime = FactoryBot.build(:anime, image:"")
    expect(anime).to be_invalid
    expect(anime.errors[:image]).to include("を入力してください")
  end

  it "quoteが空白の場合バリデーションチェックされエラーメッセージが返ってきているか" do
    anime = FactoryBot.build(:anime, quote:"")
    expect(anime).to be_invalid
    expect(anime.errors[:quote]).to include("を入力してください")
  end

  it "quote_urlが空白の場合バリデーションチェックされエラーメッセージが返ってきているか" do
    anime = FactoryBot.build(:anime, quote_url:"")
    expect(anime).to be_invalid
    expect(anime.errors[:quote_url]).to include("を入力してください")
  end

  it "introductionが空白の場合バリデーションチェックされエラーメッセージが返ってきているか" do
    anime = FactoryBot.build(:anime, introduction:"")
    expect(anime).to be_invalid
    expect(anime.errors[:introduction]).to include("を入力してください")
  end
end
