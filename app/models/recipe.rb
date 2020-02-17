class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :recipe_categories
    has_many :categories, through: :recipe_categories
    has_many :comments
    has_many :ratings
    validates :title, presence: true
    validates :level, inclusion: {in: %w(easy intermediate advanced), message: "Please be sure to enter easy, intermediate or advanced"}
    validates :cook_time, presence: true
    validates :serving_size, presence: true
    validates :directions, presence: true
    validates :ingredients, presence: true
end
