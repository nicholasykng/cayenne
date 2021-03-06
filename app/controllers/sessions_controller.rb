class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        if auth
            @user = User.find_or_create_by(name: auth['info']['name']) do |u|
                u.email = auth['info']['email']
                u.password = SecureRandom.hex
                end
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.find_by(email: params[:email])
                if @user.authenticate(params[:password])
                    session[:user_id] = @user.id 
                    redirect_to user_path(@user)
                else
                    render :new
                end
        end     
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end