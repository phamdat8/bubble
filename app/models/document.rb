class Document < ApplicationRecord
    has_one_attached :image
    has_one_attached :file
end
