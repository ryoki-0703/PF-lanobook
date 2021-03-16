class Lanobe < ApplicationRecord

  belongs_to :category
  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  #バリデーション
  validates :title, presence: true, length: { maximum: 20 }
  validates :introduction, presence: true, length: { maximum: 300 }
  validates :category_id, presence: true
end
