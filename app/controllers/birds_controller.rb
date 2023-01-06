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

    # PATCH /birds/:id
    def update
        bird = Bird.find_by(id: params[:id])
        if bird
            bird.update(bird_params)
            render json: bird
        else
            render json: { error: "Bird not found."}, status: :not_found
        end
    end
    # PATCH /birds/:id/like
    def increment_likes
        # Find bird by id.
        bird = Bird.find_by(id: params[:id])
        # If bird is found update increment likes.
        if bird
            bird.update(likes: bird.likes + 1)
            render json: bird
        # If not found render error message.
        else
            render json: { error: "Bird not found."}, status: :not_found
        end
    end



    private

    def bird_params
        params.permit(:name, :species, :likes)
    end

end
