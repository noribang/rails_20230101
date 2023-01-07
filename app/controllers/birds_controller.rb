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
        # # bird = Bird.find_by(id: params[:id])
        # bird = find_bird    
        # if bird
        #     render json: bird
        # else
        #     # render json: { error: "Bird not found" }, status: :not_found 
        #     render_not_found_response
        # end

        # If bird is found render JSON.
        # Else throw error 404 and render error message.
        bird = find_bird
        render json: bird
    rescue ActiveRecord::RecordNotFound
        render_not_found_response
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
        # # bird = Bird.find_by(id: params[:id])

        # bird = find_bird
        # if bird
        #     bird.update(bird_params)
        #     render json: bird
        # else
        #     # render json: { error: "Bird not found."}, status: :not_found
        #     render_not_found_response
        # end

        # If bird is found update bird using strong params and render.
        # Else throw 404 error and render error message.
        bird = find_bird
        bird.update(bird_params)
        render json: bird
    rescue ActiveRecord::RecordNotFound
        render_not_found_response
    end
    # PATCH /birds/:id/like
    def increment_likes
        ## Find bird by id.
        # bird = Bird.find_by(id: params[:id])
        bird = find_bird
        # If bird is found update increment likes.
        if bird
            bird.update(likes: bird.likes + 1)
            render json: bird
        # If not found render error message.
        else
            # render json: { error: "Bird not found."}, status: :not_found
            render_not_found_response
        end
    end
    # DELETE /bird/:id
    def destroy
        ## Find bird by id.
        # bird = Bird.find_by(id: params[:id])
        bird = find_bird
        # If bird found destroy bird
        if bird
            bird.destroy
            head :no_content # Returns 204 status code.
        # If bird not found render error message.
        else
            # render json: {error: "Bird not found."}, status: :not_found
            render_not_found_response
        end
    end

    private

    def bird_params
        params.permit(:name, :species, :likes)
    end

    def render_not_found_response
        render json: { error: "Bird not found."}, status: :not_found
    end

    def find_bird
        # Bird.find_by(id: params[:id])
        Bird.find(params[:id])
    end

end
