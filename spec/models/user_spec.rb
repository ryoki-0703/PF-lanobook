require 'rails_helper'


RSpec.describe User, "モデルに関するテスト", type: :model do
  describe "ユーザー登録" do
    it "name、email、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid  # user.valid? が true になればパスする
    end
  end

  context "空白のバリデーションチェック" do
    it "nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = build(:user)
      user.name = ""
      expect(user).to be_invalid
      # expect(user.errors[:name].to include("can't be blank"))
    end

    it "emailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = build(:user)
      user.email = ""
      expect(user).to be_invalid
    end

    it "passwordが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = build(:user)
      user.password = ""
      expect(user).to be_invalid
    end

    it "password_confirmationが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = build(:user)
      user.password_confirmation = ""
      expect(user).to be_invalid
    end
  end

  context "文字数のバリデーションチェック" do
    it "nameが11文字以上の場合にバリデーションチェックされ文字数のエラーメッセージが返ってきているか" do
      user = build(:user)
      user.name = "12345678901"
      expect(user).to be_invalid
    end

    it "nameが10文字以下の場合登録出来ているか" do
      user = build(:user)
      user.name = "1"
      expect(user).to be_valid
    end

    it "passwordが5文字以下の場合にバリデーションチェックされ文字数のエラーメッセージが返ってきているか" do
      user = build(:user)
      user.password = "1"
      expect(user).to be_invalid
    end

    it "passwordが6文字以上の場合登録出来ているか" do
      user = build(:user)
      user.password = "111111"
      expect(user).to be_valid
    end

    it "emailに@がついていない場合にバリデーションチェックされエラーメッセージが返ってきているか" do
      user = build(:user)
      user.email = "testmail"
      expect(user).to be_invalid
    end

    it "emailに@がついていて登録できているか" do
      user = build(:user)
      user.email = "test@mail"
      expect(user).to be_valid
    end

  end

end