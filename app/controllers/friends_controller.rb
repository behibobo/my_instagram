class FriendsController < ApplicationController

  def index
    friends = Friend.where(followee_id:current_user.id).where(accepted: false)
    render json: friends
  end 

  def create
    friend = Friend.where(follower_id: current_user.id, followee_id: params[:user_id]).first_or_initialize
    friend.save!
    render json: friend, status: :created
  end

  def accept_request
    friend = Friend.find_by(followee_id: current_user.id, follower_id: params[:user_id])
    if friend
      friend.accepted = true
      friend.save!
    end
    
    render json: {}, status: :ok
  end

  def delete_following
    following = Friend.where(follower_id: current_user.id, followee_id: params[:user_id]).first
    following.destroy unless following.nil?

    render json: {}, status: :ok
  end

  def delete_follower
    follower = Friend.where(follower_id: params[:user_id], followee_id: current_user.id).first
    follower.destroy unless follower.nil?

    render json: {}, status: :ok
  end
end
