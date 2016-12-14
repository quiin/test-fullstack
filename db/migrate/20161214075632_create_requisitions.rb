class CreateRequisitions < ActiveRecord::Migration
  def change
    create_table :requisitions do |t|
      t.float :income
      t.integer :address_years
      t.integer :company_years
      t.string :marital_status
      t.float :requested_amount
      t.string :payment_terms
      t.string :bank
      t.text :comment
      t.string :company_name
      t.string :company_phone_number
      t.string :dependents_number
      t.string :company_position
      t.boolean :has_sgmm
      t.boolean :has_imss
      t.boolean :has_car

      t.timestamps null: false
    end
  end
end
