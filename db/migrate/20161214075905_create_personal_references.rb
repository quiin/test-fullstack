class CreatePersonalReferences < ActiveRecord::Migration
  def change
    create_table :personal_references do |t|
      t.string :first_name
      t.string :second_name
      t.string :first_last_name
      t.string :second_last_name
      t.string :cell_phone_number
      t.references :requisition, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
