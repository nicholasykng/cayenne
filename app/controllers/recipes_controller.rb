class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = current_user.recipes.build(recipes_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    private
    def recipes_params
        params.require(:recipe).permit(:title, :level, :cook_time, :serving_size, :directions, category_ids: [])
    end


end