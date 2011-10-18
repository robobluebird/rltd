class QbitsController < ApplicationController
  def index
    @hub = Hub.find(params[:hub_id])
    @qbits = @hub.qbits
  end

  def show
    @hub = Hub.find(params[:hub_id])
    @qbit = @hub.qbits.find(params[:id])
  end

  def create
    @hub = Hub.find(params[:hub_id])
    if @hub.qbits.create!(params[:qbit])
      @hub.totalbits += 1
      redirect_to @hub, :notice => "qbit created :)"
    end
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
          @qbit.votes["point"] += 1
          @qbit.votes["count"] += 1
        end
        @qbit.votes["up"] << current_user.id
        @uprep = User.where(:email => @lbit.posted_by).first
        if !current_user.email.eql? @uprep.email
          @uprep.points += 1
          @uprep.save
        end
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
        @uprep = User.where(:email => @lbit.posted_by).first
        if !current_user.email.eql? @uprep.email
          @uprep.points += 1
          @uprep.save
        end
      end
    end
    @qbit.save
    render :json => {:points => @qbit.votes_point}
  end
end
