class ArcadesController < ApplicationController

    def show
        @arcade = Arcade.find(params[:id])
    end
end
