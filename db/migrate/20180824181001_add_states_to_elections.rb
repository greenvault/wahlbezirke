class AddStatesToElections < ActiveRecord::Migration[5.0]
  def change
    add_column :elections, :state, :string
  end
end
