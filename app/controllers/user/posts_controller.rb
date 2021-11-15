class User::PostsController < ApplicationController
    def index
        @posts = Post.includes(:user)
    end

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to user_posts_path, alert: "Đăng bài viết thành công"
        else
            redirect_to new_user_posts_path, alert: "Có lỗi xảy ra"
        end
    end

    private

    def post_params
        params[:post][:user_id] = current_user.id
        params.require(:post).permit(
            :content,
            :image,
            :user_id,
        )
    end
end
