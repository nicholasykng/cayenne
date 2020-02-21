class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :recipe
    validates :content, presence: true
    validates :recipe_id, uniqueness: { scope: :user_id } #User can only comment once on the recipe
end
