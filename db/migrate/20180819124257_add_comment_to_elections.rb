class AddCommentToElections < ActiveRecord::Migration[5.0]
  def change
    add_column :elections, :comment, :string
  end
end
