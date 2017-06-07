class AddDistrictRefToPrecincts < ActiveRecord::Migration[5.0]
  def change
    add_reference :precincts, :district, foreign_key: true
  end
end
