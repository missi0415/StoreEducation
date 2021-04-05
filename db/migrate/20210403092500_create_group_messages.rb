class CreateGroupMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :group_messages do |t|
      t.integer :member_id
      t.integer :group_id
      t.integer :manager_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
