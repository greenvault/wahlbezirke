class CreatePrecincts < ActiveRecord::Migration[5.0]
  def change
    create_table :precincts do |t|
      t.string :precinct_id
      t.decimal :district_score
      t.integer :district_rank
      t.integer :municipality_rank
      t.references :municipality, foreign_key: true

      t.timestamps
    end
  end
end
