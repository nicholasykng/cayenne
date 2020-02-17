class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.belongs_to :user
      t.belongs_to :recipe
      t.integer :score
      t.timestamps null: false
    end
  end
end
