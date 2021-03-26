class ScoresController < ApplicationController

    def index 
        @score = Score.all 
        render json: @score, includes: :user
    end

    def create 
        @score = Score.create(user_id: params[:user_id], score: params[:score])
        render json: @score
    end
end
