class Comment < ApplicationRecord
  belongs_to :kuser
  belongs_to :photo
end
