class BirdsController < ApplicationController

    # GET /birds
    def index
        # byebug
        birds = Bird.all
        render json: birds
    end

    # GET /birds/:id
    def show
        bird = Bird.find_by(id: params[:id])
        # render json: bird
        if bird
            render json: bird
        else
            render json: { error: "Bird not found" }, status: :not_found 
        end

    end

    # POST /birds
    def create
        byebug
    end 


end
