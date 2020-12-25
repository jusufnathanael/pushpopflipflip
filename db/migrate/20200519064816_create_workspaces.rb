class CreateWorkspaces < ActiveRecord::Migration[6.0]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.integer :max
      t.text :details

      t.timestamps
    end
  end
end
