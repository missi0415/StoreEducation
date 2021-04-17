class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :member_id
      t.string :title
      t.text  :body
      t.date  :start_on
      t.date :end_on
      t.text :member_body
      t.integer :member_status,default: 0
      t.integer :manager_status,default: 0
      t.integer :progress,default: 0
      t.timestamps
    end
  end
end
