require 'rails_helper'


RSpec.describe PostComment, "モデルに関するテスト", type: :model do
  context "コメント投稿" do
    it "commentが存在すれば登録できること" do
      # commentにはuserとlanobeとcategoryが必要なので先に生成する
      user = build(:user)
      user.save
      lanobe = build(:lanobe)
      lanobe.user_id = user.id
      category = build(:category)
      category.save
      lanobe.category_id = category.id
      lanobe.save

      post_comment = build(:post_comment)
      post_comment.user_id = user.id
      post_comment.lanobe_id = lanobe.id
      expect(post_comment).to be_valid  # post_comment.valid? が true になればパスする
    end
  end

  context "バリデーション" do
    it "空白のバリデーションチェック" do
      user = build(:user)
      user.save
      lanobe = build(:lanobe)
      lanobe.user_id = user.id
      category = build(:category)
      category.save
      lanobe.category_id = category.id
      lanobe.save

      post_comment = build(:post_comment)
      post_comment.user_id = user.id
      post_comment.lanobe_id = lanobe.id
      post_comment.comment = ""
      expect(post_comment).to be_invalid
    end

    it "commentの文字数が201文字以上の場合バリデーションチェックされエラーメッセージが返ってきているか" do
      user = build(:user)
      user.save
      lanobe = build(:lanobe)
      lanobe.user_id = user.id
      category = build(:category)
      category.save
      lanobe.category_id = category.id
      lanobe.save

      post_comment = build(:post_comment)
      post_comment.user_id = user.id
      post_comment.lanobe_id = lanobe.id
      post_comment.comment = "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
                              111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
      expect(post_comment).to be_invalid
    end

    it "commentの文字数が200文字以下の場合投稿できているか" do
      user = build(:user)
      user.save
      lanobe = build(:lanobe)
      lanobe.user_id = user.id
      category = build(:category)
      category.save
      lanobe.category_id = category.id
      lanobe.save

      post_comment = build(:post_comment)
      post_comment.user_id = user.id
      post_comment.lanobe_id = lanobe.id
      post_comment.comment = "1"
      expect(post_comment).to be_valid
    end

  end

end