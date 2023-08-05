class Photo < ApplicationRecord
  belongs_to :kuser
  has_many :comments
  has_one_attached :image, service: :amazon
end
