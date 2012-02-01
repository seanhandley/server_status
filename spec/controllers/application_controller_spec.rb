require 'spec_helper'

describe ApplicationController do

  before do
    @user = User.create(:username => 'test', :password => 'test')
  end

  context "user is logged in" do

    before do
      session.stub(:[]).with(:user_id).and_return(@user.id)
    end

    context "#current_user" do
      it "should return the user" do
        @controller.send(:current_user).should_not be_nil
      end
    end
  end

  context "user is not logged in" do
    context "#current_user" do
      it "should be nil" do
        @controller.send(:current_user).should be_nil
      end
    end
  end

  after do
    @user.destroy
  end
end
