class RemoveFieldsFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :text, :string
    remove_column :products, :string, :string
  end
end
