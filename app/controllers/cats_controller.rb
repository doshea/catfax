class CatsController < ApplicationController
  respond_to :json

  def index
    respond_with Cat.all
  end

  # def index
  #   respond_to do |format|
  #     format.json {render json: Cat.all }
  #   end
  # end

  def show
    respond_with Cat.find(params[:id])
  end

  def destroy
    Cat.find(params[:id]).destroy
    respond_with nothing: true
  end

  def create
    cat = Cat.new(cat_params)
    if cat.save
      respond_with cat
    else
      respond_with nothing: true
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :breed)
  end

end


















