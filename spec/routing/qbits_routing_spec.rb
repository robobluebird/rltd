require "spec_helper"

describe QbitsController do
  describe "routing" do

    it "routes to #index" do
      get("/qbits").should route_to("qbits#index")
    end

    it "routes to #new" do
      get("/qbits/new").should route_to("qbits#new")
    end

    it "routes to #show" do
      get("/qbits/1").should route_to("qbits#show", :id => "1")
    end

    it "routes to #edit" do
      get("/qbits/1/edit").should route_to("qbits#edit", :id => "1")
    end

    it "routes to #create" do
      post("/qbits").should route_to("qbits#create")
    end

    it "routes to #update" do
      put("/qbits/1").should route_to("qbits#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/qbits/1").should route_to("qbits#destroy", :id => "1")
    end

  end
end
