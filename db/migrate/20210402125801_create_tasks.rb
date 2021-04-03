class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :member_id
      t.string :title
      t.text  :body
      t.integer :progress
      t.timestamps
    end
  end
end
