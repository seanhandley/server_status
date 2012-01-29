require 'spec_helper'

describe Update do

  context "creating a new valid update" do

    let(:valid_update){ Update.new(description: 't'*1000,
      event: Event.new(title: 'Foo', description: 'Bar')) }

    it "should be valid" do
      valid_update.should be_valid
    end

    it "should have a description" do
      valid_update.should respond_to(:description)
    end

  end

  context "creating a new invalid update" do

    let(:invalid_update){ Update.new(
      event: Event.new(title: 'Foo', description: 'Bar')) }

    it "should be invalid without a description" do
      invalid_update.should have(1).error_on(:description)
    end

    it "should be invalid with a description that's too long" do
      invalid_update.update_attributes(description: 't'*1001)
      invalid_update.should have(1).error_on(:description)
    end

    it "should be invalid without an event" do
      Update.new(description: "Foo").should have(1).error_on(:event)
    end

  end

end