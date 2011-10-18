class HubsController < ApplicationController
  before_filter :authenticate_user!
  # GET /hubs
  # GET /hubs.xml
  def index
    @hubs = Hub.all
    @mostbits = Hub.order_by([[:totalbits, :desc]]).limit(10)
    @mostrecent = Hub.order_by([[:updated_at, :desc]]).limit(10)
    @youngest = Hub.order_by([[:created_at, :desc]]).limit(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hubs }
    end
  end

  def bits
    @hub = Hub.find(params[:id])

    @allbits = @hub.ibits.all +  @hub.lbits.all + @hub.qbits.all + @hub.tbits.all
    @allbits.each do |bit|
      bit._type = bit.class().to_s.downcase
    end

    @allbits.sort_by! { |f| f.created_at.to_f }

    page = params[:page] || 1
    per_page = 5

    if @allbits.count % per_page > 0
      limit = @allbits.count / per_page + 1
    else
      limit = @allbits.count / per_page
    end

    @allbits = @allbits[((page.to_i - 1) * per_page)...(page.to_i * per_page)]

    @prev = page.to_i == 1 ? 1 : (page.to_i - 1)
    @next = page.to_i == limit ? page : (page.to_i + 1)
  end

  def link
    @hubToLink = Hub.find(params[:hub_name])
    @hub = Hub.find(params[:id])
    @hub.hubs.push(@hubToLink)
    @hub.save
    redirect_to @hub, :notice => "linked " + @hubToLink.label + " to here!"
  end

  def links
    @hub = Hub.find(params[:id])
    @linked_hubs = @hub.hubs.all
  end

  # GET /hubs/1
  # GET /hubs/1.xml
  def show
    @hub = Hub.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hub }
    end
  end

  # GET /hubs/new
  # GET /hubs/new.xml
  def new
    @hub = Hub.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hub }
    end
  end

  # GET /hubs/1/edit
  def edit
    @hub = Hub.find(params[:id])
  end

  # POST /hubs
  # POST /hubs.xml
  def create
    hub_name = params[:hub].to_s.downcase
    @hub = Hub.new(hub_name)

    respond_to do |format|
      if @hub.save
        format.html { redirect_to(@hub, :notice => @hub.label + ' was successfully created...but it\'s quiet in here!') }
        format.xml  { render :xml => @hub, :status => :created, :location => @hub }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hub.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hubs/1
  # PUT /hubs/1.xml
  def update
    @hub = Hub.find(params[:id])

    respond_to do |format|
      if @hub.update_attributes(params[:hub])
        format.html { redirect_to(@hub, :notice => 'Hub was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hub.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hubs/1
  # DELETE /hubs/1.xml
  def destroy
    @hub = Hub.find(params[:id])
    @hub.destroy

    respond_to do |format|
      format.html { redirect_to(hubs_url) }
      format.xml  { head :ok }
    end
  end
end
