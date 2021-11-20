class Category < ApplicationRecord
    has_many :lesson

    def self.select_process user_id
        categories = Category.all.includes(:lesson)
        categories.each_with_index do |cate, index|
            cate.lesson.each do |lesson|
                check = Complete.where("lesson_id = #{lesson.id} and user_id = #{user_id}").length
                categories[index][:process] +=1 if check == 1
                categories[index][:total] += 1
            end
            
        end
        categories    
    end
end
