require 'rails_helper'


RSpec.describe FollowRelationship, "モデルに関するテスト", type: :model do
  context "フォロー、フォロワー" do
    it "ユーザーが存在すればフォローできること" do
      user1 = create(:user1)
      user2 = create(:user2)

      follow_relationship = build(:follow_relationship, follower_id: user1.id, following_id: user2.id)
      expect(follow_relationship).to be_valid
    end

    it "ユーザーが存在しなければフォローできないこと" do
      user = build(:user)
      user.save

      follow_relationship = build(:follow_relationship)
      follow_relationship.following_id = nil
      expect(follow_relationship).to be_invalid
    end

  end
end