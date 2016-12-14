class AddProfileToPersonalReferences < ActiveRecord::Migration
  def change
    add_reference :personal_references, :profile, index: true, foreign_key: true
  end
end
