class IbitsController < ApplicationController
  def index
    @hub = Hub.find(params[:hub_id])
    @ibits = @hub.ibits

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @edges }
    end
  end

  def show
    @hub = Hub.find(params[:hub_id])
    @ibit = @hub.ibits.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hub }
    end
  end

  def create
    # raise params.inspect
    @hub = Hub.find(params[:hub_id])
    @ibit = Ibit.new(params[:ibit])
    # @ibit.save
    if @hub.ibits.push(@ibit)
      redirect_to @hub, :notice => "ibit created :)"
    end
  end
end
