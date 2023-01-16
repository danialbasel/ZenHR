class RemoveTypeFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :Type, :integer
  end
end
