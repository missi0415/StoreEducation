class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :manager_id
      t.string :name
      t.string :abilitie_title
      t.string :group_image_id
      t.timestamps
    end
  end
end
