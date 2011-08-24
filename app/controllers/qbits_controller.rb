class QbitsController < ApplicationController
  def create
    @hub = Hub.find(params[:hub_id])
    @tbit = @hub.qbits.create!(params[:qbit])
    redirect_to @hub, :notice => "qbit created!"
  end
end
