class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :error

    def index
        activities = Activity.all
        render json: activities
    end

    def show
        activity = Activity.find(params[:id])
        render json: activity
    end
    
    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        head :no_content
    end

    private

    def error
        render json: {error: "Activity not found"}, status: :not_found
    end
end
