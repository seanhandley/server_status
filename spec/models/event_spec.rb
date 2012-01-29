require 'spec_helper'

describe Event do

  let(:valid_event){ Event.new(title: 'T'*30, description: 'D'*1000,
    status: Status.new(title: 'Foo')) }

  context "creating a new valid event" do

    it "should be valid" do
      valid_event.should be_valid
    end

    it "should have a title and a description" do
      valid_event.should respond_to(:title)
      valid_event.should respond_to(:description)
    end

    it "should know whether it's scheduled" do
      valid_event.scheduled?.should be_false
      valid_event.scheduled_for = Time.now + 1.day
      valid_event.scheduled?.should be_true
    end

    it "should have a status" do
      valid_event.should respond_to(:status)
    end

  end

  context "creating a new invalid event" do

    let(:invalid_event) { Event.new(status: Status.new(title: 'Foo')) }

    it "should be invalid without a title" do
      invalid_event.update_attributes(description: 'Foo')
      invalid_event.should have(1).error_on(:title)
    end

    it "should be invalid without a description" do
      invalid_event.update_attributes(title: 'Foo')
      invalid_event.should have(1).error_on(:description)
    end

    it "should be invalid with a title that's too long" do
      invalid_event.update_attributes(title: 'T'*31, description: "Foo")
      invalid_event.should have(1).error_on(:title)
    end

    it "should be invalid with a description that's too long" do
      invalid_event.update_attributes(description: 'D'*1001, title: "Foo")
      invalid_event.should have(1).error_on(:description)
    end

  end

  context "adding updates to an event" do

    it "should have updates" do
      valid_event.should respond_to(:updates)
    end

    it "should allow adding an update to an event" do
      valid_event.updates.count.should == 0
      valid_event.save
      valid_event.create_update("Foo")
      valid_event.updates.count.should == 1
    end

  end

end