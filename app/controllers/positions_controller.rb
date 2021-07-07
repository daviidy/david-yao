class PositionsController < ApplicationController
    before_action :authorize
    layout "admin"
    def index
        @positions = Position.all
    end

    def new
        @position = Position.new
    end

    def create
        @position = Position.new(position_params)
        if @position.save
            flash.notice = 'Your postiion has been added'
            redirect_to positions_path
        else
            render :new
        end
    end

    def edit
        @position = Position.find(params[:id])
    end

    def update
        @position = Position.find(params[:id])
        @position.update(position_params)

        flash.notice = "Position '#{@position.title}' Updated!"
        redirect_to positions_path
    end

    def destroy
        @position = Position.find(params[:id])
        @position.destroy
        flash.notice = "Position '#{@position.title}' deleted!"
        redirect_to positions_path
    end
    
    
    private 

    def position_params
        params.require(:position).permit(:title)
    end
end
