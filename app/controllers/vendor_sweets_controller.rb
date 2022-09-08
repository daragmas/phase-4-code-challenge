class VendorSweetsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable

    def create
        vendor_sweet = VendorSweet.create!(vendor_sweet_params)
        render json: vendor_sweet, status: 201
    end

    def destroy
        vendor_sweet = VendorSweet.find_by!(id:params[:id])
        vendor_sweet.destroy
        head :no_content
    end
    
    private

    def vendor_sweet_params
        params.permit(:vendor_id, :price, :sweet_id)
    end

    def render_not_found
        render json: {error: "VendorSweet not found"}, status: 404
    end

    def render_unprocessable invalid
        render json: {errors: invalid.record.errors.full_messages}, status: 422
    end
end
