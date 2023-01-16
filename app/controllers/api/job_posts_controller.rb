class Api::JobPostsController < ApplicationController
  before_action :set_job_post, only: %i[ update destroy ]
  before_action :authenticate

  # GET /job_posts
  def index
    @job_posts = JobPost.all

    render json: @job_posts
  end

  # POST /job_posts
  def create
    if @user['role'] == 'Admin'
      @job_post = JobPost.new(job_post_params)

      if @job_post.save
        render json: @job_post, status: :created
      else
        render json: @job_post.errors, status: :unprocessable_entity
      end
    else
        render json: {message: "You can't preform this action"},status: 401
    end
  end

  # PATCH/PUT /job_posts/1
  def update
    if @user['role'] == 'Admin'
      if @job_post != nil && @job_post.update(job_post_params)
        render json: @job_post
      else
        if @job_post != nil
          render json: @job_post.errors, status: :unprocessable_entity
        else
          render json: {message: "wrong id"}, status: :unprocessable_entity
        end
      end
    else
      render json: {message: "You can't preform this action"},status: 401
    end
  end

  # DELETE /job_posts/1
  def destroy
    if @user['role'] == 'Admin'
      @job_post.destroy
    else
      render json: {message: "You can't preform this action"},status: 401
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_post
      @job_post = JobPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @job_post= nil
    end

    # Only allow a list of trusted parameters through.
    def job_post_params
      params.require(:job_post).permit(:title, :description)
    end
end
