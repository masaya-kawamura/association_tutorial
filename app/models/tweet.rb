

class Tweet < ApplicationRecord

  belongs_to :user 
  has_many   :favorites, dependent: :destroy
  has_many   :comments,  dependent: :destroy
  # 投稿にいいねしたユーザーの一覧を、投稿詳細画面に表示。
  has_many   :favorite_users, through: :favorites, source: :user
  # 投稿にコメントしたユーザーを取得するための関連付け
  has_many   :comments_users, through: :comments,  source: :user

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
