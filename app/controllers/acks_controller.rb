class AcksController < ApplicationController
  before_filter :find_ackable
  def index
    if @ackable.class().to_s.downcase == "hub"
      @hub = @ackable
    elsif @ackable.class().to_s.downcase == "user"
      @user = @ackable
    end
    @acks = @ackable.acks
  end

  def show
    @ack = @ackable.acks.find(params[:id])
  end

  def find_ackable
    params.each do |name,value|
      if name =~ /(.+)_id$/
        return @ackable = $1.classify.constantize.find(value)
      end
    end
  end
end
