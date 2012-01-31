require 'spec_helper'

describe EventsController do

  context ' GET index' do
    it 'should load successfully' do
      get :index
      response.should be_success
    end

    it "should set up active events" do
      Event.stub_chain(:active, :order, :all).and_return([mock_model(Event, {})])
      get :index
      assigns(:active_events).count.should == 1
    end

    it "should set up scheduled events" do
      Event.stub_chain(:scheduled, :order, :all).and_return([mock_model(Event, {})])
      get :index
      assigns(:scheduled_events).count.should == 1
    end

    it "should set up resolved events" do
      Event.stub_chain(:resolved, :order, :all).and_return([mock_model(Event, {})])
      get :index
      assigns(:resolved_events).count.should == 1
    end

    it "should set up an overall status" do
      Status.stub(:overall_status).and_return("all_ok")
      get :index
      assigns(:overall_status).should == "all_ok"
    end

  end

  context "GET show" do
    it "should load successfully" do
      Event.stub(:find).with("1").and_return(mock_model(Event, {}).as_null_object)
      get :show, id: 1
      assigns(:event).should_not be_nil
      response.should be_success
    end
  end
end