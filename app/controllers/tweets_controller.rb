class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!
  # before_filter makes sure the user is logged in before showing any of the following pages

  def index
    @tweets = Tweet.all
  end

  def show
  end

  def edit
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    # instantiate a new Tweet object and store it in the @tweet intance variable
    # params are what the user passes in through the form


    respond_to do |format|

      if @tweet.save
        format.html {redirect_to @tweet, notice: 'Chirp was successfully created.'}
      else
          format.html {render :new}
        end
      end
  end


def update
  respond_to do |format|
    if @tweet.update(tweet_params)
      format.html {redirect_to @tweet, notice: 'Tweet was updated!'}
    else
      format.html {render :edit}
    end
  end
end

def destroy
  @tweet.destroy
  respond_to do |format|
    format.html {redirect_to tweets_url, notice: 'Tweet was deleted for you.'}
  end
end

private

def set_tweet
  @tweet = Tweet.find(params[:id])
end

  def tweet_params
    # It's mandatory to specify the nested attributes that should be whitelisted.
    # If you use `permit` with just the key that points to the nested attributes hash,
    # it will return an empty hash.
    params.require(:tweet).permit(:message, :user_id)
  end
end
