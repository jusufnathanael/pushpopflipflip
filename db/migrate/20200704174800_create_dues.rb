class CreateDues < ActiveRecord::Migration[6.0]
  def change
    create_table :dues do |t|
      t.string :name
      t.date :duedate
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
