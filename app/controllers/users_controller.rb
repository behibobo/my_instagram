class UsersController < ApplicationController
	before_action :authorized, only: [:auto_login]
  
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: @user.errors }, status: :unprocessable_entity
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid email or password"}
    end
  end

  def profile
    posts = Post.where(user:current_user).order(created_at: :desc)
    render json: {user: ActiveModelSerializers::SerializableResource.new(current_user), 
      posts: ActiveModelSerializers::SerializableResource.new(posts)}
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:email, :password, :first_name, :last_name)
  end
end
