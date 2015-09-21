class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(params.require(:category).permit(:name))
    if(@category.save)
      redirect_to @category
    else
      flash[:error]="Warning! All fields are mandatory."
      render 'new'
    end
  end
end
