class AddProfileToRequisitions < ActiveRecord::Migration
  def change
    add_reference :requisitions, :profile, index: true, foreign_key: true
  end
end
