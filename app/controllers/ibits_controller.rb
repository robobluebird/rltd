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

  def vote
    @hub = Hub.find(params[:hub_id])
    @ibit = @hub.ibits.find(params[:id])

    case params[:vote]
    when "up"
      if !@ibit.votes["up"].include?(current_user.id)
        if @ibit.votes["down"].include?(current_user.id)
          @ibit.votes["down"] -= [current_user.id]
          @ibit.votes["point"] += 2
        elsif
          !@ibit.votes["up"].include?(current_user.id)
          @ibit.votes["point"] += 1
          @ibit.votes["count"] += 1
        end
        @ibit.votes["up"] << current_user.id
      end
    when "down"
      if !@ibit.votes["down"].include?(current_user.id)
        if @ibit.votes["up"].include?(current_user.id)
          @ibit.votes["up"] -= [current_user.id]
          @ibit.votes["point"] -= 2
        elsif
          @ibit.votes["point"] -= 1
          @ibit.votes["count"] += 1
        end
        @ibit.votes["down"] << current_user.id
      end
    end
    @ibit.save
    render :json => {:points => @ibit.votes_point}
  end
end
