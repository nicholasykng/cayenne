class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.belongs_to :user
      t.string :title
      t.string :level
      t.string :cook_time
      t.string :serving_size
      t.string :directions
      t.timestamps null: false
    end
  end
end
