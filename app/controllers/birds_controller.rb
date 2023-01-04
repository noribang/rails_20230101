class BirdsController < ApplicationController
    wrap_parameters format: []

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
        # byebug
        # bird = Bird.create(name: params[:name], species: params[:species])
        # bird = Bird.create(params)
        # bird = Bird.create(params.permit(:name, :species))
        bird = Bird.create(bird_params)
        render json: bird, status: :created
    end 

    private

    def bird_params
        params.permit(:name, :species)
    end

end
