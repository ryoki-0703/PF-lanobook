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
      lanobe.user_id = user.id
      lanobe.category_id = category.id
      expect(lanobe).to be_valid  # lanobe.valid? が true になればパスする
    end
  end

  context "空白のバリデーションチェック" do
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = build(:user)
      user.save
      category = build(:category)
      category.save

      lanobe = build(:lanobe)
      lanobe.user_id = user.id
      lanobe.category_id = category.id
      lanobe.title = ""
      expect(lanobe).to be_invalid
    end

    it "introductionが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = build(:user)
      user.save
      category = build(:category)
      category.save

      lanobe = build(:lanobe)
      lanobe.user_id = user.id
      lanobe.category_id = category.id
      lanobe.introduction = ""
      expect(lanobe).to be_invalid
    end

    it "category_idが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = build(:user)
      user.save
      category = build(:category)
      category.save

      lanobe = build(:lanobe)
      lanobe.user_id = user.id
      expect(lanobe).to be_invalid
    end

    it "category_idが選択されている場合,投稿できているか" do
      user = build(:user)
      user.save
      category = build(:category)
      category.save

      lanobe = build(:lanobe)
      lanobe.user_id = user.id
      lanobe.category_id = category.id
      expect(lanobe).to be_valid
    end
  end

  context "文字数のバリデーションチェック" do
    it "titleの文字数が21文字以上の場合バリデーションチェックされエラーメッセージが返ってきているか" do
      user = build(:user)
      user.save
      category = build(:category)
      category.save

      lanobe = build(:lanobe)
      lanobe.user_id = user.id
      lanobe.category_id = category.id
      lanobe.title = "111111111122222222233"
      expect(lanobe).to be_invalid
    end

    it "titleの文字数が20文字以下の場合,投稿できているか" do
      user = build(:user)
      user.save
      category = build(:category)
      category.save

      lanobe = build(:lanobe)
      lanobe.user_id = user.id
      lanobe.category_id = category.id
      lanobe.title = "1"
      expect(lanobe).to be_valid
    end

    it "introductionの文字数が301文字以上の場合バリデーションチェックされエラーメッセージが返ってきているか" do
      user = build(:user)
      user.save
      category = build(:category)
      category.save

      lanobe = build(:lanobe)
      lanobe.user_id = user.id
      lanobe.category_id = category.id
      lanobe.introduction = "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
                             111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
                             111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
                             11111111111111111111111111111111111111111111111111"
      expect(lanobe).to be_invalid
    end

    it "introductionの文字数が300文字以下の場合,投稿できているか" do
      user = build(:user)
      user.save
      category = build(:category)
      category.save

      lanobe = build(:lanobe)
      lanobe.user_id = user.id
      lanobe.category_id = category.id
      lanobe.introduction = "1"
      expect(lanobe).to be_valid
    end
  end
end