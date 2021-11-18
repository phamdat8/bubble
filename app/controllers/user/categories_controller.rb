class User::CategoriesController < ApplicationController
    before_action :authenticate_user!
    def index
        @categories = Category.all
    end

    def show
        @lessons = Lesson.where("category_id = #{params[:id]}")
    end
end
