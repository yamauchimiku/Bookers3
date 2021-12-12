class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーションの記載
  has_many :books, dependent: :destroy

  # 自分がフォローされる（被フォロー）側の関係性
  # foreign_key指定により、relationshipsテーブルのどのカラムを参照するのかを指定
  # @userが削除された際、@user.relationshipsも削除する
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # そのユーザがフォローしている人orフォローされている人の一覧を表示
  # throughはあるリレーションを他のテーブルを通して実現する
  # sourceでレコードを参照する
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed

  # newとsaveを合わせた挙動をする
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  # 引数に渡したユーザをフォローしているかどうかを判定する
  def following?(user)
    followings.include?(user)
  end

  # refileを使用
  # refileの仕様でidは記載しない
  attachment :myprofile_image

  # バリデーションの記載
  validates :name, length: { in: 2..20 }, uniqueness: true
  validates :information, length: { maximum: 50 }
end
