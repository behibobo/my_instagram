class FriendsController < ApplicationController


  def index
    friends = Friend.where(followee_id:current_user.id).where(accepted: false)
    render json: friends, status: :created
  end 


  def create
    friend = Friend.first_or_create(follower_id: current_user.id, followee_id: params[:user_id])
    render json: {}, status: :created
  end

  def accept_request
    friend = Friend.find_by!(follower_id: params[:user_id])
    friend.accepted = true
    friend.save!

    render json: {}, status: :ok
  end

  def delete_request
    friend = Friend.find_by!(follower_id: params[:user_id])
    friend.destroy

    render json: {}, status: :ok
  end

end
