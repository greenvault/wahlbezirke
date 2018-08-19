class AddNameToPrecincts < ActiveRecord::Migration[5.0]
  def change
    add_column :precincts, :name, :string
  end
end
