class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :title
      t.text  :body
      t.integer :progress
      t.timestamps
    end
  end
end
