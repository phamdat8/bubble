class Lesson < ApplicationRecord
    belongs_to :category
    has_many :question

    def self.with_process category_id, user_id
        lessons = Lesson.where("category_id = #{category_id}")
        lessons.each_with_index do |lesson, index|
            check = Complete.where("lesson_id = #{lesson.id} and user_id = #{user_id}").length
            lessons[index][:complete] = true if check == 1
        end
        lessons
    end
end
