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
      user = User.new(name: "hoge")
      expect
    end
  end
end