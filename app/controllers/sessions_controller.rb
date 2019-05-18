class SessionsController < ApplicationController
    def new
        @players = Players.all
        @player = Player.new
    end

    def create
        @player = {Player}.find_by(name: params[:username])
        if @player
            session[:player_id] = @player.id
            redirect_to player_path(@player)
        else
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end