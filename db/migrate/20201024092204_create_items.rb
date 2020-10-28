class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id, null: false
      t.integer :brand_id, null: false
      t.integer :category_id, null: false
      t.string :price, null: false
      t.text :introduction, null: false
      t.string :image_id, null: false

      t.timestamps
    end
  end
end
