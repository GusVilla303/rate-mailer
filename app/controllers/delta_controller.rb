class DeltaController < ApplicationController

  def show
    @deltum = Deltum.last
  end

  def new
    @deltum = Deltum.new
  end

  def edit
    @deltum = Deltum.find(params[:id])
  end

  def update
    @deltum = Deltum.find(params[:id])
    if @deltum.update(deltum_params)
      users = User.all
      users.each { |user| user.send_email? }

      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def deltum_params
    params.require(:deltum).permit(:rate)
  end
end
