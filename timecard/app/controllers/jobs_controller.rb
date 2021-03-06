class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new
    @job.approval = params[:approval]
    @job.pay_rate = params[:pay_rate]
    @job.title = params[:title]
    @job.company_id = params[:company_id]
    @job.admin_id = params[:admin_id]
    @job.user_id = params[:user_id]

    if @job.save
      redirect_to "/jobs", :notice => "Job created successfully."
    else
      render 'new'
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    @job.approval = params[:approval]
    @job.pay_rate = params[:pay_rate]
    @job.title = params[:title]
    @job.company_id = params[:company_id]
    @job.admin_id = params[:admin_id]
    @job.user_id = params[:user_id]

    if @job.save
      redirect_to "/jobs", :notice => "Job updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    redirect_to "/jobs", :notice => "Job deleted."
  end
end
