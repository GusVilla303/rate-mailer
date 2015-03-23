class DeltaController < ApplicationController
  def new
  end

  def update
  end

  def edit
  end

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
