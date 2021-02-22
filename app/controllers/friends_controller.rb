class FriendsController < ApplicationController


  def index
    friends = Friend.where(followee_id:current_user.id).where(accepted: false)
    render json: friends, status: :created
  end 


  def create
    friend = Friend.where(follower_id: current_user.id, followee_id: params[:user_id]).first_or_initialize
    friend.save!
    render json: friend, status: :created
  end

  def accept_request
    friend = Friend.find_by!(follower_id: params[:user_id])
    friend.accepted = true
    friend.save!

    render json: {}, status: :ok
  end

  def delete_request
    following = Friend.where(follower_id: current_user.id, followee_id: params[:user_id]).first
    following.destroy unless following.nil?

    follower = Friend.where(follower_id: params[:user_id], followee_id: current_user.id).first
    follower.destroy unless follower.nil?

    render json: {}, status: :ok
  end

end
