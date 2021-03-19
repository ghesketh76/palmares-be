class AccessTokensController < ApplicationController

    def show 
        @access_token = AccessToken.all 
        render json: @access_token
    end

    def create 
        @access_token = AccessToken.create(
                            user_id: params[:user_id], 
                            scope: params[:scope], 
                            access_token: params[:access_token], 
                            expires_at: params[:expires_at]
                            )
        render json: @access_token, status: :created
    end

    def update 
        @access_token = AccessToken.find(params[:user_id])
        @access_token.update(access_token: params[:access_token], expires_at: params[:expires_at])
        render json: @access_token, status: :reset_content
    end
end
