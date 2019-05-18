class PlayersController < ApplicationController
    def show
        @player = Player.find(params[:id])
        if logged_in?
            render :show
        else
            redirect_to root_path
        end
    end
    
    def new
        @player = Player.new
    end

    def create
        @player = Player.new(player_params)
       
        if @player.save
            session[:user_id] = @player.id
            redirect_to @player
        else
            render 'new'
        end
    end

    private

    def player_params
        params.require(:player).permit(:username, :age, :allowance, :password_digest)
    end

end
