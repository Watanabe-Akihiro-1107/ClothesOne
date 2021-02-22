class ChangeColumnToNull2 < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :items, :brand_name, true
  	change_column_null :brands, :brand_name, true
  end
end
