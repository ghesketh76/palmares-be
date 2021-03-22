class ApplicationController < ActionController::API

    before_action :authorized
    skip_before_action :authorized, only: [:login]

    def current_user
        auth_header = request.headers['Authorization']
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                secret = ENV['SECRET_KEY_BASE']
                user_id = JWT.decode(token, secret)[0]["user_id"]
                @user = User.find(user_id)
            rescue
                render json: {errors: ["Bad Token"]}, status: :unauthorized
            end
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized 
        render json: {errors: ["Please Log In"]}, status: :unauthorized unless logged_in?
    end

    def login 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            secret = ENV['SECRET_KEY_BASE']
            @token = JWT.encode({user_id: @user.id}, secret)
            @resfresh_token = RefreshToken.find_by(user_id: @user.id)
            render json: {user: @user, token: @token, refresh_token: @resfresh_token}, status: :accepted
        else
            render json: {errors: ['Invalid username or password']}, status: :unauthorized
        end
    end
end
