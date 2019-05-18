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
            session[:player_id] = @player.id
            redirect_to @player
        else
            render 'new'
        end
    end

    def edit
        if current_user
            @player = current_user.id
        else
            @player = Player.find_by(id: params[:id])
            if @player = nil
                redirect_to root_path
            else
                redirect_to @player
            end
        end
    end

    def update
        @player = Player.find(params[:id])
        if @player.update(player_params)
            redirect_to @player
        else
            redirect to player_edit_path(@player)
        end
    end

    private

    def player_params
        params.require(:player).permit(:username, :age, :allowance, :password_digest)
    end

end
