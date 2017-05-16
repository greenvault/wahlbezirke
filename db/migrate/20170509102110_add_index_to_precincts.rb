class AddIndexToPrecincts < ActiveRecord::Migration[5.0]
  def self.up
    add_index :precincts, :precinct_identifier
  end

  def self.down
    remove_index :precincts, :precinct_identifier
  end
end
