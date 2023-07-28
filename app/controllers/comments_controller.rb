class CommentsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @photo = Photo.find(params[:photo_id])
      @comment = @photo.comments.build(comment_params)
      @comment.user = current_user
  
      if @comment.save
        redirect_to @photo, notice: 'El comentario se ha creado correctamente.'
      else
        render 'photos/show'
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to @comment.photo, notice: 'El comentario ha sido eliminado.'
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  