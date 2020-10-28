class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :brand_name, null: false
      t.boolean :brand_status, null: false, default: true

      t.timestamps
    end
  end
end
