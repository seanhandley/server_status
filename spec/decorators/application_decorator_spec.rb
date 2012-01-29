# encoding: UTF-8
require_relative '../../app/decorators/application_decorator.rb'

unless Object.const_defined?('ActionController')
  class ActionController
    class Base; end
  end
end


describe ApplicationDecorator do
  before do
    @klass = mock
    @decorator = ApplicationDecorator.new(@klass)
  end

  it "delegates non existent methods to the decorated object" do
    @klass.should_receive(:foo).once
    @decorator.foo
  end

  it "is transparent" do
    @decorator.class.should == @klass.class
  end

  it "can directly reference the decorated object" do
    @decorator.send(:model).should == @klass
  end

  context "shortcuts" do
    let(:mock_helper) { mock('helpers') }

    it "hands off to ActionController - truncate" do
      mock_helper.should_receive(:truncate).with("One two three", {:length => 5, :omission => "..."}).once
      ActionController::Base.should_receive(:helpers).and_return(mock_helper)
      @decorator.truncate("One two three", 5)
    end
  end
end
