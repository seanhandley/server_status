require 'spec_helper'

describe User do

  subject { User.create(:username => 'test', :password => 'test') }

  it "should have a username" do
    subject.should respond_to(:username)
  end

  it "should have a secure password" do
    subject.should respond_to(:password_digest)
    subject.password_digest.should_not === 'test'
  end

  it "should allow authentication" do
    subject.authenticate('test').should be_true
  end

  context "creating a user" do
    it "should fail without a password" do
      user = User.new(:username => 'foo')
      user.should have(1).error_on(:password)
    end
  end

  after do
    subject.destroy
  end
end
