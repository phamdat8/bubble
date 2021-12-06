class User::CategoriesController < ApplicationController
    before_action :authenticate_user!
    def index
        @categories = Category.select_process(current_user.id)
    end

    def show
        @lessons = Lesson.where("category_id = #{params[:id]}")
        @lessons = Lesson.with_process(params[:id], current_user.id)
    end
end
