class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    validates :name, uniqueness: true
    validates :quantity, uniqueness: true
    validates :name, presence: true
    validates :quantity, presence: true
end
