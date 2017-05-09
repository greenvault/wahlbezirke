class AddIndexToMunicipalities < ActiveRecord::Migration[5.0]
  def self.up
    add_index :municipalities, :name, unique: true
    add_index :municipalities, :municipality_id, unique: true
    add_index :municipalities, :district_id
  end

  def self.down
    remove_index :municipalities, :name
    remove_index :municipalities, :municipality_id
    remove_index :municipalities, :district_id

  end
end
