class ArcadesController < ApplicationController

    def index
        @arcades = Arcade.abc_order
        respond_to do |f|
            f.html{render :index}
            f.json {render json: @arcades}
        end
    end

    def show
        @arcade = Arcade.find_by(id: params[:id])
        no_arcade?
        @games = @arcade.games
        respond_to do |f|
            f.html{render :show}
            f.json {render json: @arcade}
        end
    end

    def new
        security
        @arcade = Arcade.new
    end

    def create
        @arcade = Arcade.new(arcade_params(:name, :location, :open_time, :close_time, :est_year, :owner_name))
        if @arcade.save
            redirect_to arcade_path(@arcade)
        else
            render 'new'
        end
    end

    def edit
        @arcade = Arcade.find_by(id: params[:id])
        not_owner?
    end

    def update
        @arcade = Arcade.find(params[:id])
        if @arcade.update(arcade_params(:name, :open_time, :close_time))
            redirect_to @arcade
        else
            redirect to arcade_edit_path(@arcade)
        end
    end

    def destroy
        security
        @arcade = Arcade.find(params[:id])
        if owner
            @arcade.destroy
            redirect_to arcades_path
        else
            redirect_to arcade_path(@arcade)
        end
    end

    private

    def arcade_params(*args)
        params.require(:arcade).permit(*args)
    end

    def no_arcade?
        if @arcade == nil
         redirect_to root_path
        end
    end

    def hours_of_operation
        "#{arcade.open_time} - #{arcade.close_time}"
    end

end
