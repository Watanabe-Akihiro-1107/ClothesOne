class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :items, :price, true
  end
end
