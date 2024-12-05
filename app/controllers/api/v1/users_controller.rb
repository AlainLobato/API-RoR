class Api::V1::UsersController < ApplicationController

  def index
    user = User.all
    render json: user, each_serializer: UserSerializer::UsersSerializer, status: 200
  end

  def show
    user = User.find params[:id]
    
    if user
      render json: user, status: 200
    else
      render json: user.errors, status: :not_found
    end
  end

  def create
    user = User.new user_params

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end

  end

  def update
    user = User.find params[:id]

    if user
      render json: user, status: 200
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find params[:id]

    if user
      user.destroy
      render json: user, status: 200
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:users).permit :name, :last_name, :age
  end

  def serializer
    
  end

end
