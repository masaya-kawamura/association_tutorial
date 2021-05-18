class TweetsController < ApplicationController
  before_action :authenticate_user!, escept: [:index] # deviseのメソッドでログインしていないユーザーをログイン画面に送る

  def new
    @tweet = Tweet.new #新規投稿用のからのインスタンス
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to tweets_path
  end

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
    @favorite_users = @tweet.favorite_users
  end


    private

    def tweet_params
      params.require(:tweet).permit(:body)
    end

end
