class User::LessonsController < ApplicationController
    def show
        @questions = Question.where("lesson_id = #{params[:id]}").includes(:answer)
        @lesson = params[:id]
    end
end
