class ProfileController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @profile = @user.profile.first()
  end

  def new
    @profile = Profile.new
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile.first()
  end

  def create
    @user - User.find(params[:user_id])
    @profile = Profile.new(params[:profile])
    @hub.profile.push(@profile)
  end

  # PUT /profile/1
  # PUT /profile/1.xml
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(@profile, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end
end
