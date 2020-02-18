class RatingsController < ApplicationController 
    def create
        rating = Rating.create(ratings_params)
        redirect_to rating.recipe
    end

    private
    def ratings_params
        params.require(:rating).permit(:score, :user_id, :recipe_id)
    end


end