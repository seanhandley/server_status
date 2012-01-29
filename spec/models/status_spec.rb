require 'spec_helper'

describe Status do

  context "creating a new valid status" do

    let(:valid_status){ Status.new(title: 't'*30, priority: 1) }

    it "should be valid" do
      valid_status.should be_valid
    end

    it "should have a title" do
      valid_status.should respond_to(:title)
    end

    it "should have a priority" do
      valid_status.should respond_to(:priority)
    end

  end

  context "creating a new invalid status" do

    it "should be invalid without a title" do
      Status.new.should have(1).error_on(:title)
    end

    it "should be invalid with a title that's too long" do
      Status.new(title: 't'*31).should have(1).error_on(:title)
    end

  end

end