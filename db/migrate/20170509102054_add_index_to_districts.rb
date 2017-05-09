class AddIndexToDistricts < ActiveRecord::Migration[5.0]
  def self.up
    add_index :districts, :district_id, unique: true
    add_index :districts, :state_id
  end

  def self.down
    remove_index :districts, :district_id
    remove_index :districts, :state_id
  end
end
