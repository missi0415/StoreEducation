class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :member_id
      t.integer :manager_id
      t.timestamps
    end
  end
end
