class QbitsController < ApplicationController
  def create
    @hub = Hub.find(params[:hub_id])
    @tbit = @hub.qbits.create!(params[:qbit])
    redirect_to @hub, :notice => "qbit created!"
  end
  def vote
    @hub = Hub.find(params[:hub_id])
    @qbit = @hub.qbits.find(params[:id])

    case params[:vote]
    when "up"
      if !@qbit.votes["up"].include?(current_user.id)
        if @qbit.votes["down"].include?(current_user.id)
          @qbit.votes["down"] -= [current_user.id]
          @qbit.votes["point"] += 2
        elsif
          !@qbit.votes["up"].include?(current_user.id)
          @qbit.votes["point"] += 1
          @qbit.votes["count"] += 1
        end
        @qbit.votes["up"] << current_user.id
      end
    when "down"
      if !@qbit.votes["down"].include?(current_user.id)
        if @qbit.votes["up"].include?(current_user.id)
          @qbit.votes["up"] -= [current_user.id]
          @qbit.votes["point"] -= 2
        elsif
          @qbit.votes["point"] -= 1
          @qbit.votes["count"] += 1
        end
        @qbit.votes["down"] << current_user.id
      end
    end
    @qbit.save
    render :json => {:points => @qbit.votes_point}
  end
end
