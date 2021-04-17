class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities do |t|
      t.integer :member_id
      t.integer :ability_title_id
      t.integer  :value, default: 0
      t.timestamps
    end
  end
end
