class RefreshTokensController < ApplicationController

    

    def show
        @refresh_token = RefreshToken.find(params[:user_id])
        render json: @refresh_token
    end

    def create 
        @refresh_token = RefreshToken.create(
                                user_id: params[:user_id], 
                                refresh_token: params[:refresh_token], 
                                scope: params[:scope]
                                )
        render json: @refresh_token, status: :created
    end
end
