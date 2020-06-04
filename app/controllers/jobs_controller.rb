class JobsController < ApplicationController
  before_action :set_job, only: [:edit, :update, :show, :destroy]
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
      @hosted_jobs = current_user.jobs
      @job = (Job.all.posting_date) - @hosted_jobs
    end

    def hosted_jobs
      @hosted_jobs = current_user.jobs
    end
      
    def edit
    end

    def update
    
      if @job.update(job_params)
        flash[:message] = "Job Updated Successfully."
        redirect_to job_path(@job)
      else
        flash[:error] = "Unable to Update Job, Please Try Again."
        render :edit
      end
    end

    def show 
    end

    def submit_application

      if @job.add_application_to_job(current_user)
        flash[:message] = "Applied For Job Successfully."
        redirect_to job_path(@job)
      else
        flash[:error] = "Unable to Submit Application, Please Try Again."
        redirect_to job_path(@job)
      end
    end

    def destroy

      if @job.destroy
       flash[:message] = "Job Deleted Successfully."
       redirect_to user_path(current_user)
      else
        flash[:error] = "Unable to Delete Job, Please Try Again."
        render :edit
      end
    end

    private

    def set_job
      @job = Job.find_by(id: params[:id])
    end

    def ensure_own_job
      current_user.id == params[:user_id].to_i && job.user_id == params[:user_id].to_i
    end

    def job_params
      params.require(:job).permit(:user_id, :employer_name, :description, :requirements, :compensation, :duration, :schedule, :field_of_work, :contact_info, :name, :location)
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