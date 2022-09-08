class SweetsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index 
        render json:Sweet.all
    end

    def show 
        sweet = Sweet.find_by!(id:params[:id])
        render json: sweet
    end

    private

    def render_not_found
        render json: {error: "Sweet not found"}, status: 404
    end
end
