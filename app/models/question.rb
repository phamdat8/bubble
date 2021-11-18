class Question < ApplicationRecord
  belongs_to :lesson
  has_many :answer, dependent: :destroy
end
