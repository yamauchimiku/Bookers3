class Book < ApplicationRecord
  # アソシエーションの記載
  belongs_to :user
  # バリデーションを記載
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end