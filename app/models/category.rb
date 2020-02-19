class Category < ApplicationRecord
    has_many :recipe_categories
    has_many :recipes, through: :recipe_categories
    validates :name, presence: true
    validates :name, uniqueness: true
end
