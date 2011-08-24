class IbitsController < ApplicationController
  def create
    @hub = Hub.find(params[:hub_id])
    @ibit = @hub.ibits.create!(params[:ibit])
    redirect_to @hub, :notice => "ibit created :)"
  end
end
