class RecipesController < ApplicationController
    def index
        @users = User.all
        if !params[:user].blank?
            @recipes = Recipe.by_user(params[:user])
        elsif !params[:date].blank?
            if params[:date] == "DESC"
                @recipes = Recipe.by_new
            else
                @recipes = Recipe.by_old
            end
        else
            @recipes = Recipe.all
        end
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

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipes_params)
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path
    end


    private
    def recipes_params
        params.require(:recipe).permit(:title, :level, :cook_time, :serving_size, :directions, :ingredients_list, category_ids: [], ingredient_ids: [])
    end


end