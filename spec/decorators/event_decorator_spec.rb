require_relative '../../app/decorators/application_decorator'
require_relative '../../app/decorators/event_decorator'

unless Object.const_defined?('ActionController')
  class ActionController
    class Base
    end
  end
end

describe EventDecorator do

  subject { EventDecorator.new(mock(description: 'a'*200, updated_at: Time.now)) }
  let(:mock_helper){ mock('helper') }

  context "#abridged_description" do
    it "should give an abridged version of the description" do
      mock_helper.should_receive(:truncate).once
      ActionController::Base.stub(:helpers).and_return(mock_helper)
      subject.abridged_description
    end
  end

  context "#last_updated" do
    it "should format the date sensibly" do
      '%a %d %B %Y %H:%m:%S'
      subject.last_updated.should =~ /\d\d?:\d\d?:\d\d? \w+ \d\d?\w\w \w+ \d\d\d\d/
    end
  end
end