class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|

      #omniauth fields
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :username #was name (puede ser removido??)

      #Yo te presto fields
      t.string :first_name
      t.string :second_name
      t.string :first_last_name
      t.string :second_last_name
      t.date   :birth_date
      t.string :curp
      t.string :rfc
      t.string :gender
      t.string :birth_state
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
