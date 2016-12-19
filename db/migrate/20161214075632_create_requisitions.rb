class CreateRequisitions < ActiveRecord::Migration
  def change
    create_table :requisitions do |t|
      # Personal info
      t.monetize :income
      t.integer :address_years
      t.string :marital_status
      t.string :dependents_number
      t.boolean :has_sgmm
      t.boolean :has_imss
      t.boolean :has_car
      # Work info
      t.integer :company_years
      t.string :company_name
      t.string :company_phone_number
      t.string :company_position
      #Requisition info
      t.monetize :requested_amount
      t.string :payment_terms
      t.string :bank
      t.text :comment
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
