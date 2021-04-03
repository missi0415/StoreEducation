class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities do |t|
      t.integer :member_id
      t.string :title
      t.integer  :value
      t.timestamps
    end
  end
end
