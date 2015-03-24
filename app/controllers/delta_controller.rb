class DeltaController < ApplicationController
  def new
    @deltum = Deltum.new
  end

  def edit
    @deltum = Deltum.find(params[:id])
  end

  def update
    @deltum = Deltum.find(params[:id])
    if @deltum.update(deltum_params)
      redirect_to deltum_path(@deltum)
    else
      render :edit
    end
  end

  def deltum_input
    users = User.all #what if you have 10 million users?
    deltum = Deltum.find(params[:id])
    deltum.update(deltum_params)
    #sidekiq users.each { |user| user.send_email? }
    redirect_to edit_deltum_path(deltum)
  end

  private

  def deltum_params
    params.require(:deltum).permit(:rate)
  end
end
