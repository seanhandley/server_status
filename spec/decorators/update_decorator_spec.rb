require_relative '../../app/decorators/application_decorator'
require_relative '../../app/decorators/date_decorator'
require_relative '../../app/decorators/update_decorator'

describe UpdateDecorator do

  subject { UpdateDecorator.new(mock(description: 'a'*200, updated_at: Time.now)) }
  let(:mock_helper){ mock('helper') }

  context "#timestamp" do

     it "should format the date sensibly" do
       subject.timestamp.should =~ /updated at/i
     end
   end

end