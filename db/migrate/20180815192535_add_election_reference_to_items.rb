class AddElectionReferenceToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :districts, :election, foreign_key: true
    add_reference :precincts, :election, foreign_key: true
    add_reference :municipalities, :election, foreign_key: true
  end
end
