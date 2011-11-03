class AcksController < ApplicationController
  # GET /acks
  # GET /acks.json
  def index
    @acks = Ack.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @acks }
    end
  end

  # GET /acks/1
  # GET /acks/1.json
  def show
    @ack = Ack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @ack }
    end
  end

  # GET /acks/new
  # GET /acks/new.json
  def new
    @ack = Ack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @ack }
    end
  end

  # GET /acks/1/edit
  def edit
    @ack = Ack.find(params[:id])
  end

  # POST /acks
  # POST /acks.json
  def create
    @ack = Ack.new(params[:ack])

    respond_to do |format|
      if @ack.save
        format.html { redirect_to(@ack, :notice => 'Ack was successfully created.') }
        format.json  { render :json => @ack, :status => :created, :location => @ack }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @ack.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /acks/1
  # PUT /acks/1.json
  def update
    @ack = Ack.find(params[:id])

    respond_to do |format|
      if @ack.update_attributes(params[:ack])
        format.html { redirect_to(@ack, :notice => 'Ack was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @ack.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /acks/1
  # DELETE /acks/1.json
  def destroy
    @ack = Ack.find(params[:id])
    @ack.destroy

    respond_to do |format|
      format.html { redirect_to(acks_url) }
      format.json  { head :ok }
    end
  end
end
