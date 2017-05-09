class AddIndexToStates < ActiveRecord::Migration[5.0]
  def self.up
    add_index :states, :name, unique: true
  end

  def self.down
    remove_index :states, :name, unique: true
  end
end
