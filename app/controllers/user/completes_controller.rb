class User::CompletesController < ApplicationController
    before_action :authenticate_user!
    def create
        questions = Question.where("lesson_id = #{quiz_params["lesson"]}")
        point = 0
        total = 0
        list = Array.new
        questions.each_with_index do |question, index|
            answer_id = quiz_params["#{question.id}"]
            data = Hash.new
            data[:question] = question.name
            data[:is_correct] = Answer.find(answer_id).is_correct
            data[:right] = Answer.where(is_correct: true, question_id: question.id).first.name
            if data[:is_correct]
                point += 1
            else
                
                data[:wrong] = Answer.find(answer_id).name

            end
            list << data
        end
        session[:point] = point
        session[:list] = list
        session[:lesson_id] = quiz_params["lesson"]
        redirect_to user_completes_url
    end

    def index
        @point = session[:point]
        @list = session[:list]
        lesson_id = session[:lesson_id]
        session[:point] = 0
        session[:list] = 0
        session[:lesson_id] = 0
        @rate = @point/@list.length
        complete = Complete.new()
        complete.user_id = current_user.id
        complete.lesson_id = lesson_id
        complete.save if @rate > 0.8
    end

    private

    def quiz_params
        params[:submit]
    end
end
