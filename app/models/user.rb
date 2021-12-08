class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーションの記載
  has_many :books, dependent: :destroy
  # refileを使用
  # refileの仕様でidは記載しない
  attachment :myprofile_image

  # バリデーションの記載
  validates :name, length: { in: 2..20 }, uniqueness: true
  validates :information, length: { maximum: 50 }
end
