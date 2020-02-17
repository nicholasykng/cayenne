class AddQuantityToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :quantity, :string
  end
end
