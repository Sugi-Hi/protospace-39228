class CommentsController < ApplicationController

  def create
      @comment = Comment.new(comme_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end #end抜けに要注意！

  private

  def comme_params
   params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end