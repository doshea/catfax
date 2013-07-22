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


end