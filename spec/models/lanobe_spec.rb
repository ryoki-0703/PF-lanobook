require 'rails_helper'


RSpec.describe Lanobe, "モデルに関するテスト", type: :model do
  describe "ラノベ投稿" do
    it "title、introduction、categoryが存在すれば登録できること" do
      # lanobeにはuserとcategoryが必要なので先に生成する
      user = build(:user)
      user.save
      category = build(:category)
      category.save

      lanobe = build(:lanobe)
      expect(lanobe).to be_valid  # lanobe.valid? が true になればパスする
    end
  end

  context "空白のバリデーションチェック" do
    it
  end
end