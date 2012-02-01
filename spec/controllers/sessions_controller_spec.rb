require 'spec_helper'

describe SessionsController do

  before do
    @user = User.create(:username => 'test', :password => 'test')
    #session.stub(:[]).with(:user_id).and_return(@user.id)
  end

  context "POST create" do
    context "if user exists" do
      it "should add the user to the session, flash, and redirect" do
        post :create, username: 'test', password: 'test'
        session[:user_id].should == @user.id
        flash.count.should == 1
        response.should redirect_to(root_path)
      end
    end
    context "if user does not exist" do
      it "should flash and redirect to root" do
        post :create, username: 'foo', password: 'test'
        flash.count.should == 1
        response.should redirect_to(root_path)
      end
    end
  end

  context "DELETE destroy" do
    it "should delete the user from session and redirect" do
      delete :destroy, :id => @user.id
      session[:user_id].should be_nil
      response.should redirect_to(root_path)
    end

  end

  after do
    @user.destroy
  end
end
