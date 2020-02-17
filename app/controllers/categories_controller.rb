class CategoriesController < ApplicationController
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(categories_params)
        if @category.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
    end


    private
    def categories_params
        params.require(:category).permit(:name)
    end
end