class CreateMunicipalities < ActiveRecord::Migration[5.0]
  def change
    create_table :municipalities do |t|
      t.string :name
      t.string :municipality_id
      t.references :district, foreign_key: true

      t.timestamps
    end
  end
end
