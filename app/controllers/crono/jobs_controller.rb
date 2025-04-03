module Crono
  class JobsController < ApplicationController
    def index
      render json: {
        failed: Crono::CronoJob.by_failed,
        succeed: Crono::CronoJob.by_success,
        new: Crono::CronoJob.by_new
      }, status: :ok
    end

    def show
      render json: Crono::CronoJob.find(params[:id]), status: :ok
    end
  end
end
