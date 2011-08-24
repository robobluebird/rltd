require "spec_helper"

describe LbitsController do
  describe "routing" do

    it "routes to #index" do
      get("/lbits").should route_to("lbits#index")
    end

    it "routes to #new" do
      get("/lbits/new").should route_to("lbits#new")
    end

    it "routes to #show" do
      get("/lbits/1").should route_to("lbits#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lbits/1/edit").should route_to("lbits#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lbits").should route_to("lbits#create")
    end

    it "routes to #update" do
      put("/lbits/1").should route_to("lbits#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lbits/1").should route_to("lbits#destroy", :id => "1")
    end

  end
end
