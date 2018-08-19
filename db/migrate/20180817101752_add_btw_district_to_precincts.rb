class AddBtwDistrictToPrecincts < ActiveRecord::Migration[5.0]
  def change
    add_column :precincts, :btw_district, :string
  end
end
