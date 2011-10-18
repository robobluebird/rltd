class SuggestionsController < ApplicationController
  respond_to :js
  def index
    @hubs = Hub.all(conditions:{label:/#{params[:term]}/i})
    @hubnames = []
    @hubs.each do |hub|
      @hubnames << {"label" => hub.label}
    end
    render :json => @hubnames.to_json
  end
end
