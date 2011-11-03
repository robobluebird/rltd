require "spec_helper"

describe AcksController do
  describe "routing" do

    it "routes to #index" do
      get("/acks").should route_to("acks#index")
    end

    it "routes to #new" do
      get("/acks/new").should route_to("acks#new")
    end

    it "routes to #show" do
      get("/acks/1").should route_to("acks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/acks/1/edit").should route_to("acks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/acks").should route_to("acks#create")
    end

    it "routes to #update" do
      put("/acks/1").should route_to("acks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/acks/1").should route_to("acks#destroy", :id => "1")
    end

  end
end
