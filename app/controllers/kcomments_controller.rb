class KcommentsController < ApplicationController
  before_action :authenticate_kuser!

  def create
    @photo = Photo.find(params[:photo_id])
    @kcomment = @photo.kcomments.build(kcomment_params)
    @kcomment.kuser = current_kuser

    if @kcomment.save
      redirect_to @photo, notice: 'El comentario se ha creado correctamente.'
    else
      render 'photos/show'
    end
  end

  def destroy
    @kcomment = Kcomment.find(params[:id])
    @kcomment.destroy
    redirect_to @kcomment.photo, notice: 'El comentario ha sido eliminado.'
  end

  private

  def kcomment_params
    params.require(:kcomment).permit(:content)
  end
end
