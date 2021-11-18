class User::CommentsController < ApplicationController
    before_action :authenticate_user!
    def create
        comment = Comment.new
        comment.user_id = current_user.id
        comment.post_id = params[:comment]["post_id"]
        comment.name = params[:comment]["name"]
        comment.save!
        post = Post.find( params[:comment]["post_id"])
        redirect_to user_post_path(post)
    end
end
