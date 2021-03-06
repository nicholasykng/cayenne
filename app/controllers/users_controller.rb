class UsersController < ApplicationController
    before_action :require_login, only: [:show]
    
    def index
        @users = User.all
    end

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
        render :layout => "logged_in"
    end
        
    private
    def users_params
        params.require(:user).permit(:name, :email, :password)
    end

end
