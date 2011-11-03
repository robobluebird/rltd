class TbitsController < ApplicationController
  def index
    @hub = Hub.find(params[:hub_id])
    @tbits = @hub.tbits
  end

  def create
    @hub = Hub.find(params[:hub_id])
    if @hub.tbits.create!(params[:tbit])
      @hub.totalbits += 1
      redirect_to @hub, :notice => "tbit created :)"
    end
  end

  def show
    @hub = Hub.find(params[:hub_id])
    @tbit = @hub.tbits.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tbit }
    end
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
          @tbit.votes["point"] += 1
          @tbit.votes["count"] += 1
        end
        @tbit.votes["up"] << current_user.id
        @uprep = User.where(:email => @lbit.posted_by).first
        if !current_user.email.eql? @uprep.email
          @uprep.points += 1
          @uprep.save
        end
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
        @uprep = User.where(:email => @lbit.posted_by).first
        if !current_user.email.eql? @uprep.email
          @uprep.points += 1
          @uprep.save
        end
      end
    end
    @tbit.save
    render :json => {:points => @tbit.votes_point}
  end
end
