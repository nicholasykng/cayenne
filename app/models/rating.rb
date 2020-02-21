class Rating < ApplicationRecord
    belongs_to :user
    belongs_to :recipe
    validates :score, numericality: { less_than_or_equal_to: 10 } 
    validates :score, numericality: { greater_than_or_equal_to: 0 }
    validates :score, numericality: { only_integer: true }
    validates :score, presence: true
    validates :recipe_id, uniqueness: { scope: :user_id} #User can only rate once on the recipe
end
