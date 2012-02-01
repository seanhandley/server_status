require 'spec_helper'

describe UpdatesController do

  before do
    @status = Status.create!(title: 'Baz', priority: 1)
    @event = Event.create!(title: 'Foo', description: 'Bar', status: @status)
  end

  context "POST create" do
    context "if user signed in" do
      before do
        @controller.stub(:user_signed_in?).and_return(true)
      end

      it "should find the event, add the update and redirect" do
        post :create, :update =>
           { :description => 'foo', :event_id => @event.id }

        assigns(:event).id.should == @event.id
        assigns(:event).updates.count.should == 1
        response.should redirect_to(event_path(@event.id))
      end
    end

    context "if user not signed in" do
      it "should redirect to root path" do
        post :create, :update =>
           { :description => 'foo', :event_id => @event.id }

        assigns(:event).should be_nil
        response.should redirect_to(root_path)
      end
    end
  end

  after do
    @event.destroy
    @status.destroy
  end
end
