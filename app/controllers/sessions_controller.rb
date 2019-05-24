class SessionsController < ApplicationController
    def new
        if current_user
            redirect_to '/'
        else
            @player = Player.new
        end
    end
    
      
    def create
        @player = Player.find_by(username: params[:username])
        if @player && @player.authenticate(params[:player][:password])
            session[:player_id] = @player.id
            redirect_to player_path(@player)
        else
            redirect_to signup_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end