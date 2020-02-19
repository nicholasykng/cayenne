class ApplicationController < ActionController::Base
    helper_method :current_user
    
    def current_user
        User.find_by(id: session[:user_id])
    end

    def require_login
        redirect_to login_path unless session.include? :user_id
    end

end
