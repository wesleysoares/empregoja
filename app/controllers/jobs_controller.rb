class JobsController < ApplicationController

  def new
    @job = Job.new
  end

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.create(params.require(:job).permit(:title, :company, :description, :category, :location))
    redirect_to @job
  end

end
