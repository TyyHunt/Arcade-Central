class GamesController < ApplicationController

    def show
        if arcade_present?
            @arcades = Arcade.find(params[:arcade_id])
            @game = @arcades.games.find_by(id: params[:_id])
            if @game != nil
                render 'show'
            else
                redirect_to arcade_path(@arcades)
            end
        else
            @game = Game.find(params[:id])
            @arcades = @game.arcade
        end
    end


    def index
        if arcade_present?
            @arcade = Arcade.find(params[:arcade_id])
            @games = @arcade.games
        else
            @games = Game.all
        end
    end

    def new
        security
        @game = Game.new
    end

    def create
        @game = Game.new(game_params)
        @game.valid?
        if @game.save
            redirect_to game_path(@game)
        else
            redirect_to new_game_path
        end
    end

    def edit
        @game = Game.find_by(id: params[:id])
        if authorized?
            render 'edit'
        elsif @game == nil
            redirect_to root_path
        else
            redirect_to @game
        end
    end

    def update
        @game = Game.find(params[:id])
        if @game.update(game_params)
            redirect_to @game
        else
            redirect to game_edit_path(@game)
        end
    end

    def destroy
        @game = Game.find(params[:id])
        if authorized?
            @game.destroy
            redirect_to root_path
        else
            redirect_to game_path(@game)
        end
    end

    private

    def game_params
        params.require(:game).permit(:name, :num_players, :cost, :working, :arcade_id, :player_id)
    end

    def arcade_present?
        params[:arcade_id] && Arcade.find_by(id: params[:arcade_id]) != nil
    end

    def authorized?
        logged_in? && @game.arcade.owner_name == current_user.username
    end
end
