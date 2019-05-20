class ArcadesController < ApplicationController

    def index
        @arcades = Arcade.all
    end

    def show
        @arcade = Arcade.find(params[:id])
    end

    def new
        @arcade = Arcade.new
    end

end
