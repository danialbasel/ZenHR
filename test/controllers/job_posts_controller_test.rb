require "test_helper"

class JobPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_post = job_posts(:one)
  end

  test "should get index" do
    get job_posts_url, as: :json
    assert_response :success
  end

  test "should create job_post" do
    assert_difference("JobPost.count") do
      post job_posts_url, params: { job_post: { description: @job_post.description, title: @job_post.title } }, as: :json
    end

    assert_response :created
  end

  test "should show job_post" do
    get job_post_url(@job_post), as: :json
    assert_response :success
  end

  test "should update job_post" do
    patch job_post_url(@job_post), params: { job_post: { description: @job_post.description, title: @job_post.title } }, as: :json
    assert_response :success
  end

  test "should destroy job_post" do
    assert_difference("JobPost.count", -1) do
      delete job_post_url(@job_post), as: :json
    end

    assert_response :no_content
  end
end
