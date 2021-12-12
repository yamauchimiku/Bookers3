class Relationship < ApplicationRecord
  # follower_idカラムの値から、usersテーブルのレコードを参照する
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
