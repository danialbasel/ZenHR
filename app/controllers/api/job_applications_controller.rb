class Api::JobApplicationsController < ApplicationController
  before_action :set_job_application, only: %i[ show ]
  before_action :authenticate
  #load_and_authorize_resource

  # GET /job_applications
  def index
    if @user['role'] == 'Admin'
      @job_applications = JobApplication.all
    else
      @job_applications = JobApplication.find_by_User_id(@user['id'])
    end

    render json: @job_applications || []
  end

  # GET /job_applications/1
  def show
    if @user['role'] == 'Admin'
      if !@job_application['Seen']
        @job_application.update(Seen:true)
      end
    end
    render json: @job_application
  end

  # POST /job_applications
  def create
    if @user['role'] == 'JobSeeker'
      @job_application = JobApplication.new(User_id: @user['id'],job_posts_id: job_application_params['job_posts_id'])

      if @job_application.save
        render json: @job_application, status: :created
      else
        render json: @job_application.errors, status: :unprocessable_entity
      end
    else
      render json: {message: "You can't preform this action"},status: 401
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_application_params
      params.require(:job_application).permit(:job_posts_id)
    end
    def current_user
      @current_user ||= @user
   end
end
