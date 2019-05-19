class GamesController < ApplicationController

    def show
        @game = Game.find(params[:id])
    end

    def index
        if params[:arcade_id]
          @games = Game.find(params[:arcade_id]).posts
        else
          @games = Game.all
        end
    end
end
