class PrototypesController < ApplicationController
  before_action :set_proto, except: [:index, :new ,:create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update , :destroy]
  
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(proto_params) # Prototype.createと混同しない！
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    # @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
  end

  
  def edit
    # if @prototype.edit(proto_params)
      # render :show
    # else
      # render :index
    # end
  end

  def update
    if @prototype.update(proto_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end


  def destroy
    @prototype.destroy
    redirect_to root_path
  end


   private

  def proto_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    # ×ptoro ⇒ 〇proto
  end

  def set_proto
     @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless current_user == @prototype.user
      redirect_to root_path
    end
  end

end