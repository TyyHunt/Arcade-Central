class ArcadesController < ApplicationController

    def index
        @arcades = Arcade.all
    end
    def show
        @arcade = Arcade.find(params[:id])
    end
    
end
