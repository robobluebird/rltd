class LbitsController < ApplicationController
  # POST /lbits
  # POST /lbits.xml

  def create
    @hub = Hub.find(params[:hub_id])
    @lbit = @hub.lbits.create!(params[:lbit])
    redirect_to @hub, :notice => "lbit created!"
  end

  def vote
    @hub = Hub.find(params[:hub_id])
    @lbit = @hub.lbits.find(params[:id])

    case params[:vote]
    when "up"
      if !@lbit.votes["up"].include?(current_user.id)
        if @lbit.votes["down"].include?(current_user.id)
          @lbit.votes["down"] -= [current_user.id]
          @lbit.votes["point"] += 2
        elsif
          !@lbit.votes["up"].include?(current_user.id)
          @lbit.votes["point"] += 1
          @lbit.votes["count"] += 1
        end
        @lbit.votes["up"] << current_user.id
      end
    when "down"
      if !@lbit.votes["down"].include?(current_user.id)
        if @lbit.votes["up"].include?(current_user.id)
          @lbit.votes["up"] -= [current_user.id]
          @lbit.votes["point"] -= 2
        elsif
          @lbit.votes["point"] -= 1
          @lbit.votes["count"] += 1
        end
        @lbit.votes["down"] << current_user.id
      end
    end
    @lbit.save
    render :json => {:points => @lbit.votes_point}
  end
end
