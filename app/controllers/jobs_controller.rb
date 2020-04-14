class JobsController < ApplicationController
  before_action :ensure_own_job, except: [:submit_application, :show, :index]

    def new
      @job = Job.new
    end

    def create
      @job = current_user.job.build(job_params)
      if @job.save
        redirect_to job_path(@job)
        flash[:message] = "Job Created Successfully."
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
      @job.update(job_params)
    
      if @job.update(job_prarams)
        redirect_to job_path(@job)
        flash[:message] = "Job Updated Successfully."
      else
        flash[:error] = "Unable to Update Job, Please Try Again."
        render :edit
      end
    end

    def submit_application
      if params([:job_id]).present? && params([:user_id]).present?
        JobApplication.create({:job_id => params[:id], :user_id => job_params[:user_id]})
        flash[:message] = "Successfuly Applied."
      else
        flash[:error] = "Unable to Submit Job Application, Please Try Again."
      end
    end

    def show 
      @job = Job.find_by(id: params[:id])
    end

    def destroy
      Job.destroy
    end

    private

    def ensure_own_job
      current_user.id == params[:user_id].to_i && job.user_id == params[:user_id].to_i
    end

    def job_params
      params.require(:jobs).permit(:user_id, :description, :requirements, :compensation, :duration, :schedule, :field_of_work, :contact_info, :completed)
    end

    #might be job vs. jobs

end