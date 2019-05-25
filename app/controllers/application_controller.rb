class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :security, :arcade_present?, :owner, :authorized?

    private

    def current_user
        @current_user ||= Player.find(session[:player_id]) if session[:player_id]
    end

    def logged_in?
        session[:player_id]
    end

    def security
        if !logged_in?
            redirect_to '/signin'
        end
    end

    def authorized?
        logged_in? && @game.arcade.owner_name == current_user.username
    end

    def owner
        if logged_in?
            @arcade.owner_name == current_user.username
        else
            security
        end
    end

    def not_owner?
        if !logged_in? || !owner
            redirect_to root_path  
        end
    end  
end
