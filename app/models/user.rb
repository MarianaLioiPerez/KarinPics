class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :photos
         has_many :comments
         has_one_attached :avatar 

         def admin?
          admin #metodo que devuelve si es administrador o no
        end
end
