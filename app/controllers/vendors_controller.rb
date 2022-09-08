class VendorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index 
        render json:Vendor.all
    end

    def show 
        vendor = Vendor.find_by!(id:params[:id])
        render json: vendor, serializer:VendorShowSerializer
    end

    private

    def render_not_found
        render json: {error: "Vendor not found"}, status: 404
    end
end
