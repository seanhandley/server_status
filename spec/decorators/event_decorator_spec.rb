require_relative '../../app/decorators/application_decorator'
require_relative '../../app/decorators/date_decorator'
require_relative '../../app/decorators/event_decorator'

unless Object.const_defined?('ActionController')
  class ActionController
    class Base
    end
  end
end

class String
  def humanize
    self.gsub('_',' ')
  end

  def titleize
    self
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

  context "#timestamp" do
     it "should format the date sensibly for a resolved issue" do
       subject.stub(:resolved_at).and_return(Time.now)
       subject.stub(:resolved?).and_return(true)
       subject.timestamp.should =~ /resolved at/i
     end

     it "should format the date sensibly for a scheduled issue" do
       subject.stub(:resolved?).and_return(false)
       subject.stub(:scheduled_for).and_return(Time.now)
       subject.stub(:scheduled?).and_return(true)
       subject.timestamp.should =~ /scheduled for/i
     end

     it "should format the date sensibly for a live issue" do
       subject.stub(:scheduled?).and_return(false)
       subject.stub(:resolved?).and_return(false)
       subject.timestamp.should =~ /updated at/i
     end
   end

end