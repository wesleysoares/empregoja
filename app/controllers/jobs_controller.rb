class JobsController < ApplicationController
  def index
    @jobs = Job.all
    @companies = Company.all
    @categories = Category.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
    @categories = Category.all
  end

  def create
    @job = Job.new(job_params)
    if(@job.save)
      redirect_to @job
    else
      flash[:error] = "Warning! All fields are mandatory."
      @companies = Company.all
      @categories = Category.all
      render 'new'
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :location, :category_id, :company_id, :description, :featured)
  end
end
