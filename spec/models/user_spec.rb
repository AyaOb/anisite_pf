require 'rails_helper'

RSpec.describe User, type: :model do
  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "nameが空白だった場合にバリデーションチェックされエラーメッセージが返ってきているか" do
    user = FactoryBot.build(:user, name: '')
    expect(user).to be_invalid
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "emailが空白だった場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
    user = FactoryBot.build(:user, email: '')
    expect(user).to be_invalid
    expect(user.errors[:email]).to include("を入力してください")
  end

    it "passwordが空白だった場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
    user = FactoryBot.build(:user, password: '')
    expect(user).to be_invalid
    expect(user.errors[:password]).to include("を入力してください")
  end
end
