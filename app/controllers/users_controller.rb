class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(users_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def index
        @user = current_user
    end
        

    private
    def users_params
        params.require(:user).permit(:name, :email, :password)
    end

end