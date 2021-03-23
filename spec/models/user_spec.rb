require 'rails_helper'
# require_relative './spec_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe "ユーザー登録" do
    it "name、email、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid  # user.valid? が true になればパスする
    end
  end

  context "空白のバリデーションチェック" do
    it "nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.updated_at(name: "テスト")
      expect(user).to be_invalid
      # expect(user.errors[:name].to include("can't be blank"))
    end

    it "emailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.create(email: "test@mail")
      expect(user).to be_invalid
    end

    it "passwordが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.create(password: "111111")
      expect(user).to be_invalid
    end

    it "password_confirmationがpasswordと同じになっていない場合にバリデーションチェックされエラーメッセージが返ってきているか" do
      user = User.create(password_confirmation: "111111")
      expect(user).to be_invalid
    end
  end

  context "文字数のバリデーションチェック" do
    it "nameが11文字以上の場合にバリデーションチェックされ文字数のエラーメッセージが返ってきているか" do
      user = User.create(name: "テスト")
      expect(user).to be_invalid
    end

    it "passwordが11文字以下の場合にバリデーションチェックされ文字数のエラーメッセージが返ってきているか" do
      user = User.create(password: "111111")
      expect(user).to be_invalid
    end

  end
end