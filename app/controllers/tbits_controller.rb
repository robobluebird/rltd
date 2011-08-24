class TbitsController < ApplicationController
  def create
    @hub = Hub.find(params[:hub_id])
    @tbit = @hub.tbits.create!(params[:tbit])
    redirect_to @hub, :notice => "tbit created!"
  end
end
