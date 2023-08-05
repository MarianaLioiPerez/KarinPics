class PhotosController < ApplicationController
  before_action :authenticate_kuser!, except: [:index, :show]
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

    def index
      @photos = Photo.all
    end
  
    def show
      @photo = Photo.find(params[:id])
      @comments = @photo.comments
      @comment = Comment.new
    end
  
    def new
      @photo = Photo.new
    end
  
    def create
      @photo = current_kuser.photos.build(photo_params)
      if @photo.save
        redirect_to @photo, notice: 'La foto se ha subido correctamente.'
      else
        render :new
      end
    end
  
    private

    def set_photo
      @photo = Photo.find_by(id: params[:id])
      redirect_to root_path, alert: 'La foto no existe.' if @photo.nil?
    end
  
    def photo_params
      params.require(:photo).permit(:title, :description, :image)
    end

    def authorize_admin
        redirect_to root_path, alert: 'Acceso no autorizado.' unless current_kuser.admin?
      end
      

  end
