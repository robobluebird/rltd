require "spec_helper"

describe TbitsController do
  describe "routing" do

    it "routes to #index" do
      get("/tbits").should route_to("tbits#index")
    end

    it "routes to #new" do
      get("/tbits/new").should route_to("tbits#new")
    end

    it "routes to #show" do
      get("/tbits/1").should route_to("tbits#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tbits/1/edit").should route_to("tbits#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tbits").should route_to("tbits#create")
    end

    it "routes to #update" do
      put("/tbits/1").should route_to("tbits#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tbits/1").should route_to("tbits#destroy", :id => "1")
    end

  end
end
