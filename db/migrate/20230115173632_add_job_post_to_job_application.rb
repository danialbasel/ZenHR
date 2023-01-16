class AddJobPostToJobApplication < ActiveRecord::Migration[7.0]
  def change
    add_reference :job_applications, :job_posts, null: false, foreign_key: true
  end
end
