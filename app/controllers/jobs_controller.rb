class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    company = Company.find(job_params[:company_id]) if job_params[:company_id]
    @job = Job.new(job_params)
    @job.company = company
    if(@job.save)
      redirect_to @job
    else
      @companies = Company.all
      render 'new'
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured)
  end
end
