class PlayersController < ApplicationController
    
    def show
        @player = Player.find_by(id: params[:id])
        if @player != nil
            render :show
        else
            redirect_to root_path
        end
    end
    
    def new
        security
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
        security
        @player = Player.find_by(id: params[:id])
    end

    def update
        @player = Player.find(params[:id])
        if @player.update(player_params)
            redirect_to @player
        else
            redirect to player_edit_path(@player)
        end
    end

    def destroy
        @player = Player.find(params[:id]).destroy
        if @player == current_user
            session.clear
        end
        redirect_to root_path
    end

    private

    def player_params
        params.require(:player).permit(:username, :age, :allowance, :password)
    end

end
