require 'rails_helper'

RSpec.describe JobPost, type: :model do
  describe 'validations' do
    it 'validates presence of title' do
      job_post = JobPost.new(title: nil)
      expect(job_post).to_not be_valid
    end
    it 'validates maximum length of title' do
      job_post = JobPost.new(title: 'a' * 101)
      expect(job_post).to_not be_valid
    end
    it 'validates uniqueness of title' do
      job_post1 = JobPost.create(title: 'Software Engineer')
      job_post2 = JobPost.new(title: 'Software Engineer')
      expect(job_post2).to_not be_valid
    end
    it 'validates presence of description' do
      job_post = JobPost.new(description: nil)
      expect(job_post).to_not be_valid
    end
    it 'validates maximum length of description' do
      job_post = JobPost.new(description: 'a' * 256)
      expect(job_post).to_not be_valid
    end
  end
end
