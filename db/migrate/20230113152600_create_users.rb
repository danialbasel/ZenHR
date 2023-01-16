class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :Email
      t.string :password_digest
      t.integer :Type

      t.timestamps
    end
    add_index :users, :Email, unique: true
  end
end
