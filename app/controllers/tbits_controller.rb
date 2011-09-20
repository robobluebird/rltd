class TbitsController < ApplicationController
  def create
    @hub = Hub.find(params[:hub_id])
    @tbit = @hub.tbits.create!(params[:tbit])
    redirect_to @hub, :notice => "tbit created!"
  end
  def vote
    @hub = Hub.find(params[:hub_id])
    @tbit = @hub.tbits.find(params[:id])

    case params[:vote]
    when "up"
      if !@tbit.votes["up"].include?(current_user.id)
        if @tbit.votes["down"].include?(current_user.id)
          @tbit.votes["down"] -= [current_user.id]
          @tbit.votes["point"] += 2
        elsif
          !@tbit.votes["up"].include?(current_user.id)
          @tbit.votes["point"] += 1
          @tbit.votes["count"] += 1
        end
        @tbit.votes["up"] << current_user.id
      end
    when "down"
      if !@tbit.votes["down"].include?(current_user.id)
        if @tbit.votes["up"].include?(current_user.id)
          @tbit.votes["up"] -= [current_user.id]
          @tbit.votes["point"] -= 2
        elsif
          @tbit.votes["point"] -= 1
          @tbit.votes["count"] += 1
        end
        @tbit.votes["down"] << current_user.id
      end
    end
    @tbit.save
    render :json => {:points => @tbit.votes_point}
  end
end
