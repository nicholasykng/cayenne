class RecipesController < ApplicationController
    layout "logged_in"
    before_action :require_login
    def index
        @users = User.all
        if !params[:user].blank?
            @recipes = Recipe.by_user(params[:user])
        elsif !params[:date].blank?
            if params[:date] == "Descending"
                @recipes = Recipe.by_new
            else
                @recipes = Recipe.by_old
            end
        else
            if params[:user_id]
                @user = User.find_by(id: params[:user_id])
                if @user.nil?
                    redirect_to users_path, alert: "User not found."
                else
                    @recipes = @user.recipes
                end
            else
                @recipes = Recipe.all
            end
        end
    end

    def new
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to users_path, alert: "User not found."
        else
            @recipe = Recipe.new(user_id: params[:user_id])
        end
    end

    def create
        @recipe = current_user.recipes.build(recipes_params)
        if @recipe.save
            redirect_to @recipe
        else
            render :new
        end
    end

    def show
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @recipe = @user.recipes.find_by(id: params[:id])
            if @recipe.nil?
                redirect_to user_recipes_path(@user), alert: "Recipe not found."
            end
        else
            @recipe = Recipe.find(params[:id])
        end
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
        params.require(:recipe).permit(:user_id, :title, :level, :cook_time, :serving_size, :directions, :ingredients_list, category_ids: [], ingredient_ids: [], categories_attributes: [:name], ingredients_attributes: [:name])
    end


end