require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  describe 'callbacks' do
    it 'sets seen to false before save' do
      @user = User.new(Email: "test@email.com",password: "123")
      @user.save
      @job_post = JobPost.new(title: "test title",description: "test description")
      @job_post.save
      job_application = JobApplication.new(User_id: @user['id'],job_posts_id: @job_post['id'])
      job_application.save
      expect(job_application.Seen).to be false
    end
  end
end
