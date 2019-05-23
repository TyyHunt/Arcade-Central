class GamesController < ApplicationController

    def show
        if params[:arcade_id] && Arcade.find_by(id: params[:arcade_id]) != nil
            @arcade = Arcade.find(params[:arcade_id])
            @game = @arcade.games.find_by(id: params[:id])
            if @game != nil
                render 'show'
            else
                redirect_to arcade_path(@arcade)
            end
        end
    end


    def index
        if params[:arcade_id] && Arcade.find_by(id: params[:arcade_id]) != nil
            @arcade = Arcade.find(params[:arcade_id])
            @games = @arcade.games
        else
            @games = Game.all
        end
    end

    def new
        @game = Game.new
    end

    def create
        @game = Game.new(game_params(:name, :num_players, :cost, :working, :arcade_id, :player_id))
        raise params.inspect
        if @game.save
            redirect_to game_path(@game)
        else
            redirect_to new_game_path
        end
    end

    def edit
        @game = Game.find_by(id: params[:id])
        if @game.arcade.owner_name == current_user.username
            render 'edit'
        elsif @game == nil
            redirect_to root_path
        else
            redirect_to @game
        end
    end

    def update
        @game = Game.find(params[:id])
        if @game.update(game_params(:name, :num_players, :cost, :working, :arcade_id))
            redirect_to @game
        else
            redirect to game_edit_path(@game)
        end
    end

    def destroy
        @game = Game.find(params[:id])
        if @game.arcade.owner_name == current_user.username
            @game.destroy
            redirect_to root_path
        else
            redirect_to game_path(@game)
        end
    end

    private

    def game_params(*args)
        params.require(:game).permit(*args)
    end
end
