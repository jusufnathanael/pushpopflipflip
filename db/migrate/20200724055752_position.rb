class Position < ActiveRecord::Migration[6.0]
  def change
    add_column :workspaces, :position, :integer
  end
end
