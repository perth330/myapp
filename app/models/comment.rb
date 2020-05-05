class Comment < ApplicationRecord
  belongs_to :question  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
