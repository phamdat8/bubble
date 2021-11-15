class User::CompletesController < ApplicationController
    def create
        questions = Question.where("lesson_id = #{quiz_params["lesson"]}")
        point = 0
        total = 0
        questions.each do |question|
            total += 1
            answer = quiz_params["#{question.id}"]
            result = Answer.where(question_id: question.id, id: answer, is_correct: true)
            point += 1 unless result.length == 0
        end
        session[:point] = point
        session[:total] = total
        session[:lesson_id] = quiz_params["lesson"]
        redirect_to user_completes_url
    end

    def index
        @point = session[:point]
        @total = session[:total]
        lesson_id = session[:lesson_id]
        session[:point] = 0
        session[:total] = 0
        session[:lesson_id] = 0
        @rate = @point/@total
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
