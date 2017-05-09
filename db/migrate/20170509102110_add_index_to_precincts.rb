class AddIndexToPrecincts < ActiveRecord::Migration[5.0]
  def self.up
    add_index :precincts, :precinct_id, unique: true
  end

  def self.down
    remove_index :precincts, :precinct_id, unique: true
  end
end
