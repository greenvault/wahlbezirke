class RecreateIndex < ActiveRecord::Migration[5.0]
  def change
    remove_index :districts, :district_identifier
    add_index :districts, :district_identifier
    remove_index :municipalities, :municipality_identifier
    add_index :municipalities, :municipality_identifier
  end
end
