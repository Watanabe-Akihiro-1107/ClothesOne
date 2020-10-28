class ChangeColumn2 < ActiveRecord::Migration[5.2]
  def change
  	change_column :brands, :brand_name, :string, null: false
  	change_column :brands, :brand_status, :boolean, default: true, null: false

  	change_column :categories, :category_name, :string, null: false
  	change_column :categories, :category_status, :boolean, default: true, null: false

  	change_column :items, :user_id, :integer, null: false
  	change_column :items, :brand_id, :integer, null: false
  	change_column :items, :category_id, :integer, null: false
    change_column :items, :image_id, :string, null: false
    change_column :items, :introduction, :text, null: false
    change_column :items, :price, :string, null: false

    change_column :users, :nickname, :string, null: false
  end
end
