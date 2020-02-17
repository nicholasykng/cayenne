class CreateRecipeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_categories do |t|
      t.belongs_to :recipe 
      t.belongs_to :category
      t.timestamps null: false
    end
  end
end
