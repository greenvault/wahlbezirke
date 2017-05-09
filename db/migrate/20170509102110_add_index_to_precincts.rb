class AddIndexToPrecincts < ActiveRecord::Migration[5.0]
  def self.up
    add_index :precincts, :precinct_id, unique: true
    add_index :precincts, :municipality_id
  end

  def self.down
    remove_index :precincts, :precinct_id
    remove_index :precincts, :municipality_id
  end
end
