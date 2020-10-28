class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category_name, null: false
      t.boolean :category_status, null: false, default: true

      t.timestamps
    end
  end
end
