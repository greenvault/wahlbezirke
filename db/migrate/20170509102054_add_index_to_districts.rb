class AddIndexToDistricts < ActiveRecord::Migration[5.0]
  def self.up
    add_index :districts, :district_id, unique: true
  end

  def self.down
    remove_index :districts, :district_id, unique: true
  end
end
