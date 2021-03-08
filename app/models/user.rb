class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lanobes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image

  #バリデーション
  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, length: { is: 6 }
end
