require 'rails_helper'
require "#{Rails.root}/lib/JsonWebToken"

RSpec.describe "Api::JobPosts", type: :request do



  describe "GET /api/job_posts" do
    it "returns a 200 there is a valid user and authrization" do
      User.create(Email: "test@gmail.com",password: "123")
      @JWT = JsonWebToken.encode({UserID: 1})
      headers = { "Authorization" => "Bearer #{@JWT}"}
      get "/api/job_posts", :headers => headers
      expect(response).to have_http_status(:ok)
    end
    it "returns a 401 when there is no authrization header" do
      get "/api/job_posts"
      expect(response).to have_http_status(401)
    end
    it "returns a 401 when the authrization header is invalid" do
      headers = { "Authorization" => "Bearer test"}
      get "/api/job_posts", :headers => headers
      expect(response).to have_http_status(401)
    end
  end





  describe "POST /api/job_posts" do
    it "returns a 201 there is a valid user role and authrization" do
      User.create(Email: "test@gmail.com",password: "123",role:"Admin")
      @JWT = JsonWebToken.encode({UserID: 1})
      headers = { "Authorization" => "Bearer #{@JWT}"}
      params = {"job_post":{"title": "test title","description": "test description"}}
      post "/api/job_posts",:params=> params, :headers => headers
      expect(response).to have_http_status(:created)
    end
    it "returns a 401 there is a valid user role and authrization" do
      User.create(Email: "test@gmail.com",password: "123",role:"JobSeeker")
      @JWT = JsonWebToken.encode({UserID: 1})
      headers = { "Authorization" => "Bearer #{@JWT}"}
      params = {"job_post":{"title": "test title","description": "test description"}}
      post "/api/job_posts",:params=> params, :headers => headers
      expect(response).to have_http_status(401)
    end
    it "returns a 401 when there is no authrization header" do
      params = {"job_post":{"title": "test title","description": "test description"}}
      post "/api/job_posts",:params=> params
      expect(response).to have_http_status(401)
    end
    it "returns a 401 when the authrization header is invalid" do
      headers = { "Authorization" => "Bearer test"}
      params = {"job_post":{"title": "test title","description": "test description"}}
      post "/api/job_posts",:params=> params, :headers => headers
      expect(response).to have_http_status(401)
    end
  end





  describe "PUT /api/job_posts/:id" do
    it "returns a 200 there is a valid user role and authrization" do
      User.create(Email: "test@gmail.com",password: "123",role:"Admin")
      JobPost.create(title: "new title",description: "new description")
      @JWT = JsonWebToken.encode({UserID: 1})
      headers = { "Authorization" => "Bearer #{@JWT}"}
      params = {"job_post":{"title": "test title","description": "test description"}}
      put "/api/job_posts/1",:params=> params, :headers => headers
      expect(response).to have_http_status(:ok)
    end
    it "returns a 401 there is a valid user role and authrization" do
      User.create(Email: "test@gmail.com",password: "123",role:"JobSeeker")
      JobPost.create(title: "new title",description: "new description")
      @JWT = JsonWebToken.encode({UserID: 1})
      headers = { "Authorization" => "Bearer #{@JWT}"}
      params = {"job_post":{"title": "test title","description": "test description"}}
      put "/api/job_posts/1",:params=> params, :headers => headers
      expect(response).to have_http_status(401)
    end
    it "returns a 401 when there is no authrization header" do
      JobPost.create(title: "new title",description: "new description")
      params = {"job_post":{"title": "test title","description": "test description"}}
      put "/api/job_posts/1",:params=> params
      expect(response).to have_http_status(401)
    end
    it "returns a 401 when the authrization header is invalid" do
      JobPost.create(title: "new title",description: "new description")
      headers = { "Authorization" => "Bearer test"}
      params = {"job_post":{"title": "test title","description": "test description"}}
      put "/api/job_posts/1",:params=> params, :headers => headers
      expect(response).to have_http_status(401)
    end
    it "returns a 422 when the job post id is wrong" do
      User.create(Email: "test@gmail.com",password: "123",role:"Admin")
      @JWT = JsonWebToken.encode({UserID: 1})
      headers = { "Authorization" => "Bearer #{@JWT}"}
      params = {"job_post":{"title": "test title","description": "test description"}}
      put "/api/job_posts/1",:params=> params, :headers => headers
      expect(response).to have_http_status(422)
    end
  end





end
