class JobsController < ApplicationController
  before_action :ensure_own_job, except: [:submit_application, :show, :index]
  before_action :edit_own_jobs_only, only: [:edit, :update, :destroy]

    def new
      @job = Job.new
    end

    def create
      @job = current_user.jobs.build(job_params)
      if @job.save
        flash[:message] = "Job Created Successfully."
        redirect_to job_path(@job)
      else
        flash[:error] = "Unable to Post Job, Please Try Again."
        render :new
      end
    end

    def index
      @job = Job.all
    end

    def edit
      @job = Job.find(params[:id])
    end

    def update
      @job = Job.find(params[:id])
    
      if @job.update(job_params)
        flash[:message] = "Job Updated Successfully."
        redirect_to job_path(@job)
      else
        flash[:error] = "Unable to Update Job, Please Try Again."
        render :edit
      end
    end

    def submit_application
      if params[:job_id].present? && JobApplication.create({:job_id => params[:job_id], :user_id => current_user.id})
        flash[:message] = "Successfuly Applied."
        redirect_to user_path(@user)
      else
        flash[:error] = "Unable to Submit Job Application, Please Try Again."
        redirect_to 
      end
    end

    def show 
      @job = Job.find_by(id: params[:id])
    end

    def destroy
      @job = Job.find_by(id: params[:id])

      if @job.destroy
       flash[:message] = "Job Deleted Successfully."
       redirect_to user_path(current_user)
      else
        flash[:error] = "Unable to Delete Job, Please Try Again."
        render :edit
      end
    end

    private

    def ensure_own_job
      current_user.id == params[:user_id].to_i && job.user_id == params[:user_id].to_i
    end

    def job_params
      params.require(:job).permit(:user_id, :description, :requirements, :compensation, :duration, :schedule, :field_of_work, :contact_info, :name, :location)
    end

    def edit_own_jobs_only
      @job = Job.find_by(id: params[:id])
      current_user.id == @job.user_id
      if current_user.id != @job.user_id
        flash[:error] = "You Can Only Edit Your Own Jobs."
        redirect_to root_path
      end
    end

end