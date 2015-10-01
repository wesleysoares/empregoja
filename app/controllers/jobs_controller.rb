class JobsController < ApplicationController
  before_action :load_collections, only: [:index, :new, :edit]
  before_action :load_job, only: [:show, :edit, :update]

  def index
    @jobs = Job.unexpired_jobs
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      flash[:error] = 'Warning! All fields are mandatory.'
      load_collections
      render :new
    end
  end

  def edit
  end

  def update
    @job.update! job_params
    redirect_to @job
  end

  private

  def load_collections
    @companies = Company.all
    @categories = Category.all
  end

  def load_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(
      :title,
      :location,
      :category_id,
      :company_id,
      :description,
      :featured
    )
  end
end
