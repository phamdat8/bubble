class User::LessonsController < ApplicationController
    before_action :authenticate_user!
    def show
        @questions = Question.where("lesson_id = #{params[:id]}").includes(:answer)
        @lesson = params[:id]
    end
end
