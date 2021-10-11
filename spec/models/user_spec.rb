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

  it "nameが重複している場合にバリデーションチェックされエラーメッセージが返ってきているか" do
    user1 = FactoryBot.build(:user, name: 'aaa')
    user1.save
    user2 = FactoryBot.build(:user, name: 'aaa')
    expect(user2).to be_invalid
    expect(user2.errors[:name]).to include("はすでに存在します")
  end

  it "emailが重複している場合にバリデーションチェックされエラーメッセージが返ってきているか" do
    user1 = FactoryBot.build(:user)
    user1.save
    user2 = FactoryBot.build(:user)
    user2.email = user1.email
    expect(user2).to be_invalid
    expect(user2.errors[:email]).to include("はすでに存在します")
  end
end
