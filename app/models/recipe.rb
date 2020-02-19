class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :recipe_categories
    has_many :categories, through: :recipe_categories
    has_many :comments
    has_many :ratings
    validates :title, presence: true
    validates :level, inclusion: {in: %w(Easy Intermediate Advanced), message: "Please be sure to enter Easy, Intermediate or Advanced"}
    validates :cook_time, presence: true
    validates :serving_size, numericality: {only_integer: true}
    validates :directions, presence: true
    validates :ingredients, presence: true
    validates :categories, presence: true
    accepts_nested_attributes_for :categories
    accepts_nested_attributes_for :ingredients

    def self.by_user(user_id)
        where(user: user_id)
    end

    def self.by_new
        order(created_at: :desc)
    end

    def self.by_old
        order(created_at: :asc)
    end

    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attribute|
            if category_attribute['name'].present?
                category = Category.find_or_create_by(category_attribute)
                self.categories << category
            end
        end
    end

    def ingredients_attributes=(ingredient_attributes)
        ingredient_attributes.values.each do |ingredient_attribute|
            if ingredient_attribute["name"].present?
                ingredient = Ingredient.find_or_create_by(ingredient_attribute)
                self.ingredients << ingredient
            end
        end
    end

    def average_rating
        self.ratings.average(:score)
    end

        
end
