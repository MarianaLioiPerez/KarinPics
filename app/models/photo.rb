class Photo < ApplicationRecord
  belongs_to :kuser
  has_many :kcomments
  has_one_attached :image, service: :amazon
end
