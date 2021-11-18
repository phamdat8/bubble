class User::UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        redirect_to edit_user_users_path(current_user) unless current_user.name
        @user = User.find(current_user.id)
        @posts = Post.where(user_id: current_user.id)
    end

    def edit
        @user = User.find(current_user.id)
    end

    def create
        @user = User.find(current_user.id)
        @user.update(user_params)
        @posts = Post.where(user_id: current_user.id)
        render :index
    end

    private

    def user_params
        params.require(:user).permit(
            :name,
            :image,
            :id
        )
    end

end
