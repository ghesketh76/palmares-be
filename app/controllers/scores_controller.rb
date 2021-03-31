class ScoresController < ApplicationController

    def index 
        @score = Score.all 
        render json: @score, include: :user
    end

    def create 
        @score = Score.create(user_id: params[:user_id], score: params[:score])
        render json: @score
    end

    def non_user_scores
        @scores = Score.filter do |score|
            score[:user_id] != @user.id
        end
        render json: @scores
    end
end
