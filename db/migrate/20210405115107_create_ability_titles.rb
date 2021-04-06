class CreateAbilityTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :ability_titles do |t|
      t.integer :group_id
      t.string :title
      t.timestamps
    end
  end
end