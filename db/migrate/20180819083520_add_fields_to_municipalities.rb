class AddFieldsToMunicipalities < ActiveRecord::Migration[5.0]
  def change
    add_column :municipalities, :ars, :string
    add_column :municipalities, :district_score, :decimal
  end
end
