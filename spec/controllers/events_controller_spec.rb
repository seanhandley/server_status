require 'spec_helper'

describe EventsController do

  context "authenticated actions" do

    before do
      @status = Status.create!(title: 'Baz', priority: 1)
      @event = Event.create!(title: 'Foo', description: 'Bar', status: @status)
    end

    context "when unauthenticated" do

      it "should redirect away" do
        get :new
        response.should redirect_to(root_path)
        get :edit, id: 1
        response.should redirect_to(root_path)
        post :create
        response.should redirect_to(root_path)
        post :update, id: 1
        response.should redirect_to(root_path)
      end
    end

    context "when authenticated" do

      before do
        @controller.stub(:user_signed_in?).and_return(true)
        @controller.stub(:current_user).and_return(User.create(:username => 'test', :password => 'test'))
      end

      context "GET new" do
        it "should create a new event" do
          get :new
          assigns(:event).should_not be_nil
        end
      end

      context "GET edit" do
        it "should find the event" do
          get :edit, id: @event.id
          assigns(:event).should_not be_nil
          assigns(:event).id.should == @event.id
        end
      end

      context "POST create" do
        it "should create the event and render show" do
          post :create, :event => {:title => 'Foo', :description => 'Bar', :status_id => @status_id}
          assigns(:event).should_not be_nil
          response.should render_template(:show)
        end
      end

      context "POST update" do
        it "should find the event, update it and render show" do
          post :update, :id => @event.id, :event => {:title => 'Foooooo', :description => 'Baaaaaar', :status_id => @status_id}
          assigns(:event).should_not be_nil
          response.should render_template(:show)
        end
      end
    end

     def create
       @event = Event.create(params[:event])
       render :show, id: @event.id
     end

     def update
       @event = Event.find(params[:id])
       @event.update_attributes(params[:event])
       render :show, id: @event.id
     end

    after do
      @event.destroy
      @status.destroy
    end

  end

  context "unauthenticated actions" do
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

    context "GET feed" do
      it "should respond successfully with xml" do
        get :feed, :format => 'atom'
        response.should be_success
        assigns(:all_events).should_not be_nil
      end
    end
  end
end