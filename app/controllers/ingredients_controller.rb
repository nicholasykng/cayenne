class IngredientsController < ApplicationController
    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredients_params)
        if @ingredient.save
            redirect_to ingredients_path
        else
            render :new
        end
    end

    def index
        @ingredients = Ingredient.all
    end

    def show
        @ingredient = Ingredient.find(params[:id])
    end

    private
    def ingredients_params
        params.require(:ingredient).permit(:name)
    end
end