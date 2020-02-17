class ChangeRecipesColumn < ActiveRecord::Migration[6.0]
  def change
    change_table :recipes do |t|
      t.rename :ingredients, :ingredients_list
    end
  end
end
