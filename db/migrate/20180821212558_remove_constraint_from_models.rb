class RemoveConstraintFromModels < ActiveRecord::Migration[5.0]
  def change
    change_column :districts, :district_identifier, :string, unique: false
    change_column :municipalities, :municipality_identifier,
      :string, unique: false
  end
end
