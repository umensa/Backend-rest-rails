class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/:id
  def show
    # code here
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: { error:
        "Unable to create user: #{@user.errors.full_messages.to_sentence}"},
        status: 400
    end
  end

  # PUT /users/:id
  def update
    # code here
    if @user.update(user_params)
      render json: @user,
      status: :ok
    else
      render json: @user.errors,
      status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    render json: { message: 'User record successfully deleted.'},
    status: 200
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
