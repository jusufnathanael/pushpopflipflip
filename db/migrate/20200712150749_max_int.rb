class MaxInt < ActiveRecord::Migration[6.0]
  def change
    change_column :workspaces, :max, 'integer USING CAST(max AS integer)'
  end
end
