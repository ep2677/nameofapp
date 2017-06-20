class ChangeDataTypeForProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price, :int
  end
end
