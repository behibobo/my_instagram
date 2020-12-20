class HomeController < ApplicationController
    def index
        @posts = Post.order(created_at: :desc).includes(:user)
        render json: @posts
    end
end
