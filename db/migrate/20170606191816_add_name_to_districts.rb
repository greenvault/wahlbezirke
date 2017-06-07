class AddNameToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :name, :string
  end
end
