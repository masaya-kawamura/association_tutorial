class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @favorite_tweets = @user.favorite_tweets
    # 上記は以下のコードの省略形。user.rbでメソッドが定義されている
    # @favorete_tweets = @user.favorites.map{|favorite| favorite.tweet }
  end
end
