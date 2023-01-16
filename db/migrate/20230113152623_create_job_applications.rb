class CreateJobApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applications do |t|
      t.references :User, null: false, foreign_key: true
      t.boolean :Seen

      t.timestamps
    end
  end
end
