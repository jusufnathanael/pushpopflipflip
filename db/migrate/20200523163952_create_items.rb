class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :owner
      t.numeric :quantity
      t.text :details
      t.string :picture
      t.references :workspace, null: false, foreign_key: true

      t.timestamps
    end
  end
end
