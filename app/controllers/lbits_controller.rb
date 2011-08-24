class LbitsController < ApplicationController
  # POST /lbits
  # POST /lbits.xml
  def create
    @hub = Hub.find(params[:hub_id])
    @lbit = @hub.lbits.create!(params[:lbit])
    redirect_to @hub, :notice => "lbit created!"
  end
end
