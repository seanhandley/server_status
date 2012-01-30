require_relative '../../app/decorators/date_decorator'

class DummyClass
  def ordinalize(day)
    "#{day}st"
  end
end

describe DateDecorator do

  subject { DummyClass.new }

  context "#formatted_date" do
    it "should format the date sensibly" do
      subject.extend(DateDecorator)
      subject.formatted_date(Time.now).should =~ /\d\d?:\d\d?:\d\d? \w+ \d\d?\w\w \w+ \d\d\d\d/i
    end
  end

end