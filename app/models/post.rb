class Post < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy
  has_one_attached :image
end
