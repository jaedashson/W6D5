class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index # views/cats/index.html.erb
  end
  
  def show 
    @cat = Cat.find(params[:id])

    if @cat
      render :show
    else
      redirect_to cat_url
    end
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end
  
end