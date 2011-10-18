require "spec_helper"

describe LeaderboardsController do
  describe "routing" do

    it "routes to #index" do
      get("/leaderboards").should route_to("leaderboards#index")
    end

    it "routes to #new" do
      get("/leaderboards/new").should route_to("leaderboards#new")
    end

    it "routes to #show" do
      get("/leaderboards/1").should route_to("leaderboards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/leaderboards/1/edit").should route_to("leaderboards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/leaderboards").should route_to("leaderboards#create")
    end

    it "routes to #update" do
      put("/leaderboards/1").should route_to("leaderboards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/leaderboards/1").should route_to("leaderboards#destroy", :id => "1")
    end

  end
end
