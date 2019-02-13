class EpicenterController < ApplicationController
  def feed
  	@following_tweets = []
  	@tweet = Tweet.new
  	

  	if current_user == nil
  		return
  	end


  	Tweet.all.order(created_at: :desc).each do |tweet|
  		if current_user.id == tweet.user_id || 
  			current_user.following.include?(tweet.user_id)
  			@following_tweets.push(tweet)
  		end
  	end
  end

  def show_user
  	@user = User.find(params[:id])
  end

  def now_following
  	current_user.following.push(params[:id].to_i)
  	current_user.save

  	redirect_to show_user_path(id: params[:id])
  end

  def unfollow
  	current_user.following.delete(params[:id].to_i)
  	current_user.save

  	redirect_to show_user_path(id: params[:id])
  end
def tag_tweets
	@tag = Tag.find(params[:id])
	end 
end
