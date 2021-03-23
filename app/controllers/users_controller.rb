class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]

    def profile 
        render json: {user: @user}
    end

    def index 
        @users = User.all 
        render json: @users
    end

    def create 
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            secret = ENV['SECRET_KEY_BASE']
            @token = JWT.encode({user_id: @user.id}, secret)
            render json: {user: @user, token: @token}, status: :created
        else
            render json: {errors: @user.errors.full_messages}, status: :not_acceptable
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :age)
    end
end
