class CreateChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :checks do |t|
      t.integer :member_id
      t.integer :group_message_id
      t.timestamps
    end
  end
end
