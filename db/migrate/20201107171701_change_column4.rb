class ChangeColumn4 < ActiveRecord::Migration[5.2]
  def change
  	change_column :items, :brand_name, :string, null: false
  	change_column :items, :item_name, :string, null: false

  	change_column :item_comments, :comment, :text, null: false
  end
end
