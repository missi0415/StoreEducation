class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.integer :member_id
      t.string :title
      t.text  :body
      t.integer :progress,default: 0
      t.timestamps
    end
  end
end
