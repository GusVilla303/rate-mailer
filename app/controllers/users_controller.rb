class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

    def create
    @user = User.new(user_params)

    if @user.save!
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :rate)
  end

  # delta controller

  def delta_input
    # @delta = Delta.last.rate
    # @users = User.where(emailed: 2)
    users = User.all #what if you have 10 million users?
    delta = Delta.find(params[:id])
    delta.update(delta_params)
    #sidekiq users.each { |user| user.send_email? }
    redirect_to edit_delta_path(delta)
  end

  def delta_params
    params.require(:delta).permit(:rate)
  end

end
