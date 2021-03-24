RSpec.describe FollowRelationship, "モデルに関するテスト", type: :model do
  context "フォロー、フォロワー" do
    it "ユーザーが存在すればフォローできること" do
      user = build(:user)
      user.save

      follow_relationship = build(:follow_relationship)
      follow_relationship.following_id = user.id
      expect(follow_relationship).to be_valid
    end

    it "ユーザーが存在しなければフォローできないこと" do
      user = build(:user)
      user.save

      follow_relationship = build(:follow_relationship)
      follow_relationship.following_id = ""
      expect(follow_relationship).to be_invalid
    end

    it "フォローされていれば、フォロワーが表示されること" do
      user = build(:user)
      user.save

      follow_relationship = build(:follow_relationship)
      follow_relationship.follower_id = user.id
      expect(follow_relationship).to be_valid
    end

    it "フォローされていなければ、フォロワーが表示されないこと" do
      user = build(:user)
      user.save

      follow_relationship = build(:follow_relationship)
      follow_relationship.follower_id = ""
      expect(follow_relationship).to be_invalid
    end

  end
end