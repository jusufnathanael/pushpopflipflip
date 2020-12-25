class ItemFinish < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :finish, :boolean, default: false
  end
end
