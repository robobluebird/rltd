require "spec_helper"

describe IbitsController do
  describe "routing" do

    it "routes to #index" do
      get("/ibits").should route_to("ibits#index")
    end

    it "routes to #new" do
      get("/ibits/new").should route_to("ibits#new")
    end

    it "routes to #show" do
      get("/ibits/1").should route_to("ibits#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ibits/1/edit").should route_to("ibits#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ibits").should route_to("ibits#create")
    end

    it "routes to #update" do
      put("/ibits/1").should route_to("ibits#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ibits/1").should route_to("ibits#destroy", :id => "1")
    end

  end
end
