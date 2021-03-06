class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lanobes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_lanobes, through: :favorites, source: :lanobe

  has_many :following_relationships, foreign_key: "follower_id", class_name: "FollowRelationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "FollowRelationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  attachment :profile_image

  # バリデーション
  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true
  # validates :encrypted_password, presence: true, length: {in: 2..10}

  # すでにフォロー済みであればture返す
  def following?(other_user)
    followings.include?(other_user)
  end

  # ユーザーをフォローする
  def follow(other_user)
    following_relationships.create(following_id: other_user.id)
  end

  # ユーザーのフォローを解除する
  def unfollow(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy!
  end

  # ゲストユーザー
  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def favorite_destroy(lanobe_id)
    favorite = favorites.find_by(lanobe_id: lanobe_id)
    favorite.destroy # favoriteを削除すること　(trueをかえす)
  end

  def writes?(lanobe)
    lanobe.user == self
  end
end
