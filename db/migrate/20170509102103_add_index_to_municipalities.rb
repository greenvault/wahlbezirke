class AddIndexToMunicipalities < ActiveRecord::Migration[5.0]
  def self.up
    add_index :municipalities, :name
    add_index :municipalities, :municipality_id, unique: true
  end

  def self.down
    remove_index :municipalities, :name
    remove_index :municipalities, :municipality_id
  end
end
