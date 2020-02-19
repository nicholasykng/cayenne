class CategoriesController < ApplicationController
    layout "logged_in"
    before_action :require_login

    def new
        @category = Category.new
    end

    def index
        @categories = Category.all 
    end


    def create
        @category = Category.new(categories_params)
        if @category.save
            redirect_to categories_path
        else
            render :new
        end
    end

    def show
        @category = Category.find(params[:id])
    end

    private
    def categories_params
        params.require(:category).permit(:name)
    end
end