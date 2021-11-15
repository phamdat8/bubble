class User::CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def show
        @lessons = Lesson.where("category_id = #{params[:id]}")
    end
end
