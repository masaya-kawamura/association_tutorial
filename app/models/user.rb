class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :favorites
  has_many :comments
  # ユーザーがいいねした投稿一覧を取得するための関連付け
  has_many :favorite_tweets, through: :favorites, source: :tweet
  # ユーザーがコメントした投稿の情報を取得する関連付け
  has_many :comment_tweets,  through: :comments,  source: :tweet

  # ユーザーがいいねした投稿情報を取得する。
  # これを使わないとcontrollerで以下のように記述しなければならない。
  # @favorete_tweets = @user.favorites.map{|favorite| favorite.tweet }
  # 上のコードは、@userのいいね（favorites）した情報一覧をmapメソッドブロックへ
  # ブロック内では、渡されたいいねの情報に紐ついているtweetを配列で返している。
  # そのため、@favorite_tweetsの中には、そのユーザーのいいねした投稿情報一覧が配列で格納されている。


end
